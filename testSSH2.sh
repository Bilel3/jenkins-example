def remote = [:]
remote.name = "DESKTOP-4AB5TSM"
remote.host = '192.168.56.1'
remote.allowAnyHosts = true

node {
    withCredentials([usernamePassword(credentialsId: 'bbayoudhi', passwordVariable: 'Spark2020*-+', usernameVariable: 'bbayoudhi')]) {
        remote.user = bbayoudhi
        remote.password = Spark2020*-+

        stage("SSH Steps ") {
            writeFile file: 'test.sh', text: 'ls'
            sshCommand remote: remote, command: 'for i in {1..5}; do echo -n \"Loop \$i \"; date ; sleep 1; done'
            sshScript remote: remote, script: 'test.sh'
            sshPut remote: remote, from: 'test.sh', into: '.'
            sshGet remote: remote, from: 'test.sh', into: 'test_new.sh', override: true
            sshRemove remote: remote, path: 'test.sh'
        }
    }
}
