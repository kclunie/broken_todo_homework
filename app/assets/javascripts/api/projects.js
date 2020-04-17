$( document ).ready(function() {
    console.log( "ready!" );
    listenForSubmitForm()
});

class Project {
	constructor(obj) {
		this.id = obj.id
		this.title = obj.title
	}
 
}

Project.prototype.projectHTML = function () {
	return (`	
		<div class='post'>
			<h3>${this.title}</h3>
		</div>
	`)
}

function listenForSubmitForm(){
    $("#new_project").on("submit", function(e){
		e.preventDefault()
        console.log("submitting project")
        const values = $(this).serialize()
        console.log("values", values)
		$.post("/projects", values).done(function(data){
			console.log("data", data)
			$("#new-project-container").html("")
			const newProject = new Project(data)
			const htmlToAdd = newProject.projectHTML()
			$("#new-project-container").html(htmlToAdd)
		})
	})
}