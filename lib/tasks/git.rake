task :push => [:pull, :spec, "spec:smoke"] do
  sh "git push"
end

task :pull do
  sh "git pull --rebase"
end