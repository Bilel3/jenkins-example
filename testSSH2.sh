node {
  def remote = [:]
  remote.name = 'DESKTOP-4AB5TSM'
  remote.host = '192.168.56.1'
  remote.user = 'bbayoudhi'
  remote.password = 'Spark2020*-+'
  remote.allowAnyHosts = true
  stage('Remote SSH') {
    sshCommand remote: remote, command: "ls -lrt"
    sshCommand remote: remote, command: "for i in {1..5}; do echo -n \"Loop \$i \"; date ; sleep 1; done"
  }
}
