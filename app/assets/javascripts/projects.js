// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$( document ).ready(function() {
    console.log( "ready2!" );

});

$( document ).ready(function() {
	console.log( "ready!" );
	listenForClick()
    listenForSubmitForm()
});

function listenForClick() {
	$('button#projects-data').on('click', function (event) {
		event.preventDefault()
		console.log("clicking projects index button")
		getProjects()
	})
}

function getProjects() {
	console.log("in the getprojects function")
	$.ajax({
		url: 'http://localhost:3000/api/projects',
		method: 'get',
		dataType: 'json'
	}).done(function (data){

			console.log("the data is: ", data)
			data.map(project => {
				const newProject = new Project(project)
				projects.push(newProject)
				const newProjectHtml = newProject.projectHTML()
				document.getElementById('ajax-projects').innerHTML += newProjectHtml
				console.log(projects)
			})
		})
	}

	const projects = []

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
		$.post("/api/projects", values).done(function(data){
			console.log("data", data)
			$("#new-project-container").html("")
			const newProject = new Project(data)
			const htmlToAdd = newProject.projectHTML()
			$("#new-project-container").html(htmlToAdd)
		})
	})
}