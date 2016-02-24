#Crear 25 proyectos de manera automatizada

25.times.each_with_index do |projects, index|
  project = Project.create(name: "Project number #{index}", description: "This is my project number #{index}")

  project.entries.create(
    date: Date.today - rand(10).days,
    hours: rand(24),
    minutes: rand(60)
    )
end



#1.upto(25) {|index| Project.create(name: "Project number #{index}", description: "This is my project number #{index}")  }