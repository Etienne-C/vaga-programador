require 'open-uri'
require 'nokogiri'

class Job < ApplicationRecord
  validates :job_title, :description, :company, :city, presence: true

  def scrapping_infojobs
    page = 0
    2.times do # Change in function of the number pages
      page += 1
      html_file = open("http://m.infojobs.com.br/vagas-de-emprego-programador.aspx?Page=#{page}").read
      html_doc = Nokogiri::HTML(html_file)

      html_doc.search('//a/ol/@id').each do |id|
        job_id = id.text
        next if job_id.empty?

        html_job = open("http://m.infojobs.com.br/detail.aspx?vc=#{job_id}").read
        html_job_doc = Nokogiri::HTML(html_job)

        description1 = html_job_doc.search('ol.descriptionItems').text
        description2 = html_job_doc.search('div.vacancyRequirements').text
        description_all = description1 + description2

        next if Job.exists?(jobkey: :job_id)
        Job.create!(
          jobkey: job_id,
          job_title: html_job_doc.search("h1").text,
          description: description_all,
          company: html_job_doc.search("h3.companyName").text,
          url: "http://www.infojobs.com.br/vaga-de-programador__#{job_id}.aspx",
          city: html_job_doc.search("span.js_litLocation").text,
          source: "infojobs")
      end
    end
  end

end
