$( document ).ready(function() {
	console.log( "ready!" );
	listenForClick()
    listenForSubmitForm()
});

function listenForClick() {
	$('button#events-data').on('click', function (event) {
		event.preventDefault()
		console.log("clicking projects show button")
		getEvents()
	})
}

function getEvents() {
	console.log("in the getevents function")
	$.ajax({
		url: 'http://localhost:3000/api/projects',
		method: 'get',
		dataType: 'json'
	}).done(function (data){

			console.log("the data is: ", data)
			data.map(event => {
				const newEvent = new Project(event)
				events.push(newEvent)
				const newEventHtml = newEvent.projectHTML()
				document.getElementById('ajax-events').innerHTML += newEventHtml
				console.log(events)
			})
		})
	}

	const events = []

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