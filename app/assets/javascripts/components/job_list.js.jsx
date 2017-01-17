var JobList = React.createClass({
  render: function() {
    return (
      <div className="wrapper-index-jobs">
        {this.props.jobs.map(function(job){
          return <JobListItem job={job} key={job.id} />;
        })}
      </div>
    );
  }
});
