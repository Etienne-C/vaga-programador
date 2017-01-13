require 'open-uri'
require 'nokogiri'

class Job < ApplicationRecord
  validates :job_title, :description, :company, :city, presence: true

  def scrapping_infojobs
    page = 0
    1.times do # Change in function of the number pages
      page += 1
      html_file = open("http://m.infojobs.com.br/vagas-de-emprego-programador.aspx?Page=#{page}").read
      html_doc = Nokogiri::HTML(html_file)

      html_doc.search('//a/ol/@id').each do |id|
        job_id = id.text
        next if job_id.empty?

        html_job = open("http://www.infojobs.com.br/vaga-de-programador__#{job_id}.aspx").read
        html_job_doc = Nokogiri::HTML(html_job)
        next if Job.exists?(jobkey: :job_id)
        Job.create!(
          jobkey: job_id,
          job_title: html_job_doc.search("span#ctl00_phMasterPage_cVacancySummary_litVacancyTitle").text,
          description: html_job_doc.search("ol.descriptionItems")[0].text,
          salary: html_job_doc.search("span#ctl00_phMasterPage_cVacancySummary_litSalary").text,
          contract: html_job_doc.search("span#ctl00_phMasterPage_cVacancySummary_litContractType").text,
          company: html_job_doc.search("span#ctl00_phMasterPage_cVacancySummary_litCompany").text,
          company_description: html_job_doc.search("span#ctl00_phMasterPage_cCompanyLogo_litDescription").text,
          candidate_description: html_job_doc.search("ol.descriptionItems")[1].text,
          city: html_job_doc.search("span#ctl00_phMasterPage_cVacancySummary_litLocation").text,
          url: "http://www.infojobs.com.br/vaga-de-programador__#{job_id}.aspx",
          source: "infojobs")
      end
    end
  end
end
