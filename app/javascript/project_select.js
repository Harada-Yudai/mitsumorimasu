window.addEventListener('load', function(){
  let PushButton = document.getElementById("project_5")
  
  PushButton.addEventListener('click', function() {
      console.log("click OK")
      let title = document.getElementById("project_5").value
      console.log(title)
    })
  })