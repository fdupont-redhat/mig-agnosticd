OUR_DIR=`pwd`

if [[ -z "${AGNOSTICD_HOME}" ]]; then
    echo "Please ensure that 'AGNOSTICD_HOME' is set before running."
    exit
fi

pushd .
cd ${AGNOSTICD_HOME} 
ansible-playbook ${AGNOSTICD_HOME}/ansible/main.yml -e @${OUR_DIR}/my_vars.yml -e @${OUR_DIR}/ocp4_vars.yml -e @${OUR_DIR}/../../../../secret.yml --skip-tags step003,step004,infra_workloads,student_workloads,post_flight_check
popd 
