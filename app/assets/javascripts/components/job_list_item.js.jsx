var JobListItem = React.createClass({
  render: function() {
    return (
      <div className="cell-list">
        <a href={this.props.JobsPath + "/" + this.props.job.id}>
          <h2>{this.props.job.job_title}</h2>
          <div className="cell-list-content-icon font-text-space gray" >
            <span><i className="fa fa-briefcase icons"></i>{this.props.job.company}</span>
            <span className="text-center"><i className="fa fa-map-marker icons"></i>{this.props.job.city}</span>
          </div>
          <p className="font-text-space gray">{this.props.job.description}...</p>
        </a>
      </div>
    );
  }
});
