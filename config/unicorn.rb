working_directory ENV['APP_PATH']

stderr_path ENV['APP_PATH'] + "/log/unicorn.log"
stdout_path ENV['APP_PATH'] + "/log/unicorn.log"

pid ENV['APP_PATH'] + "/pids/unicorn.pid"
listen ENV['UNICORN_SOCKET']

worker_processes 2
timeout 30
