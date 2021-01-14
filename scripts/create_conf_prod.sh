#!/bin/bash
#creating the appdynamics configuration files for java and the machine agent

cat << 'EOF' > /opt/appdynamics/javaagent/conf/controller-info.xml<controller-info>

    <!--  For detailed information on the ways you can configure the Java Agent
    and configuration order of precedence, see:
    https://docs.appdynamics.com/display/LATEST/Administer+the+Java+Agent

    The agent applies configurations in the following order of precedence.
      1. Environment variables.
      2. System properties passed on the command line.
      3. Versioned agent properties.    /$(Agent-Base-Install-Dir)/ver$(agent-version-no)/conf/agent.properties
      4. Global agent properties.       /$(Agent-Base-Install-Dir)/conf/agent.properties
      5. Versioned configuration file.  /$(Agent-Base-Install-Dir)/ver$(agent-version-no)/conf/controller-info.xml
      6. Global configuration file.     /$(Agent-Base-Install-Dir)/conf/controller-info.xml  -->

    <!--  The host name or the IP address of the AppDynamics Controller.
    For example, 192.168.1.22 or myhost or myhost.abc.com
    This is the same host that you use to access the AppDynamics Controller user interface.
    You can override this configuration with an environment variable 'APPDYNAMICS_CONTROLLER_HOST_NAME' or
    the system property '-Dappdynamics.controller.hostName'  -->

    <controller-host>medpro.saas.appdynamics.com</controller-host>

    <!--  The http(s) port of the AppDynamics Controller. If 'controller-ssl-enabled' below is set to true, you must
    specify the HTTPS port of the Controller, otherwise specify the HTTP port. The Controller listens on port 8090 by default.
    If you set 'controller-ssl-enabled' to true, the Controller listens on port 8181.
    If you are using a saas Controller, the ssl port is 443
    This is the same port that you use to access the AppDynamics Controller user interface.
    You can override this configuration with an environment variable 'APPDYNAMICS_CONTROLLER_PORT' or
    the system property '-Dappdynamics.controller.port'  -->

    <controller-port>443</controller-port>

    <!--  Connect to the Controller using SSL(HTTPS). If you set this to true,
    set the controller-port property to the HTTPS port for the Controller.
    The agent only connects to the Controller using SSL when you enable this property. Otherwise, the
    agent connects to the Controller using HTTP.
    You can override this configuration with an environment variable 'APPDYNAMICS_CONTROLLER_SSL_ENABLED' or
    the system property '-Dappdynamics.controller.ssl.enabled'  -->

    <controller-ssl-enabled>true</controller-ssl-enabled>

    <!--  Truncate the hostname to remove the domain name.
    For example, 'server.mydomain.com' becomes 'server'. Hostnames with no domain remain unchanged.
    For exmaple; 'server'.  -->

    <use-simple-hostname>false</use-simple-hostname>

    <!--  The logical business application name that this jvm node belongs to.
    This is not the deployment name (ear/war/jar) on the application server.
    For example, you may name a business application name 'ACME Portal' if you are monitoring
    a portal application or 'ACME ECommerce' etc. If a business application of this name does not exist,
    the Controller creates one automatically.
    You can override this configuration with an environment variable 'APPDYNAMICS_AGENT_APPLICATION_NAME' or
    the system property '-Dappdynamics.agent.applicationName'  -->

    <application-name>Eis</application-name>

    <!--  The logical business tier this node belongs to.
    For example, a tier can be 'ACME Frontend' or 'ACME Backend Service' etc.
    If your JVM / appserver startup script contains a system property that you want to use for the tier name,
    for example, -Dserver.tier, you can refer to the system property similarly: ${server.tier}
    You can use expressions like ${server.tier}_${some.property}.MyTier to define the tier name.
    You can override this configuration with an environment variable 'APPDYNAMICS_AGENT_TIER_NAME' or
    the system property '-Dappdynamics.agent.tierName'  -->

    <tier-name>Prod</tier-name>

    <!--  Unique name for this jvm node. The name must be unique within the business application. e.g. weblogicinstance23 or
    hweb24. If your JVM / appserver startup script contains a system property that you want to use for the node name,
    For example, -Dserver.name, you can refer to the system property similarly: ${server.name}.
    The value for server.name will be used as AppDynamics node name.
    You can use expressions like ${server.name}_${host.name}.MyNode to define the node name.
    You can override this configuration with an environment variable 'APPDYNAMICS_AGENT_NODE_NAME' or
    the system property '-Dappdynamics.agent.nodeName'  -->

    <node-name>replaceme</node-name>

    <!--  The runtime directory for all runtime files (logs, transaction configuration) for agent nodes using this agent
    installation. This optional property defaults to the agent-installation-directory . If you specify a different directory,
    the agent writes all agent logs to agent-runtime-dir/logs/node-name. The agent writes transaction configuration to files to
    agent-runtime-dir/conf/node-name. You can override this configuration with an environment variable 'APPDYNAMICS_AGENT_BASE_DIR'
    or the system property '-Dappdynamics.agent.runtime.dir'  -->

    <agent-runtime-dir></agent-runtime-dir>

    <!--  Enable features required for AppDynamics Orchestration.
    When true, the agent is able to resolve the AppDynamics Controller host and port
    when the host machine where this agent resides is created through AppDynamics Orchestration.
    If the host machine where this agent resides is NOT created through Orchestration then LEAVE
    this flag set to 'false'.  -->

    <enable-orchestration>false</enable-orchestration>

    <!--  Encrypt agent credentials.
    Before you enable Use Encrypted Credentials, see the instructions on how to initialize the
    Secure Credential Store:
    https://docs.appdynamics.com/display/LATEST/Encrypt+Credentials+for+Agent+Configuration
    When true, the agent to uses encrypted credentials from the secure credential store.
    When true, you must supply the credential store file name and the obfuscated credential store password.  -->

    <use-encrypted-credentials></use-encrypted-credentials>

    <!--  Full qualified path name for the SCS-KeyStore file name.  -->

    <credential-store-filename></credential-store-filename>

    <!--  Password for the 'Secure Credential Store' (SCS). This password must be obfuscated.  -->

    <credential-store-password></credential-store-password>

    <!--  Enable agent-side mutual authentication with the Controller. Required when the Controller is configured for client authentication  -->

    <use-ssl-client-auth>false</use-ssl-client-auth>

    <!--  Asymmetric keystore filename  -->

    <asymmetric-keystore-filename></asymmetric-keystore-filename>

    <!--  Asymmetric keystore password - If SCS is enabled, use the encrypted password.  -->

    <asymmetric-keystore-password></asymmetric-keystore-password>

    <!--  Asymmetric key password - If SCS is enabled, use the encrypted password.  -->

    <asymmetric-key-password></asymmetric-key-password>

    <!--  Asymmetric key alias - Only set this alias if the keystore has multiple keys for deterministic key selection. -->

    <asymmetric-key-alias></asymmetric-key-alias>

    <!--  The account name for multi-tenant Controllers.
    You can override this configuration with an environment variable 'APPDYNAMICS_AGENT_ACCOUNT_NAME' or
    the system property '-Dappdynamics.agent.accountName'  -->

    <account-name>medpro</account-name>

    <!--  The account access key.
    You can override this configuration with an environment variable 'APPDYNAMICS_AGENT_ACCOUNT_ACCESS_KEY' or
    the system property '-Dappdynamics.agent.accountAccessKey'
    if 'use-encrypted-credentials' is set to true, use the encrypted the account access key.  -->

    <account-access-key>1ovg9ek842xl</account-access-key>

    <!--  Change to 'true' only under special circumstances when you want to override this node's application name
    or tier name after this agent has been moved to a new application and/or tier in the Controller UI. When true,
    the agent uses the application name and/or tier name from the configuration file. -->

    <force-agent-registration>false</force-agent-registration>

    <auto-naming>false</auto-naming>

</controller-info>
EOF
cat << 'EOF' > /opt/appdynamics/machine-agent/conf/controller-info.xml<?xml version="1.0" encoding="UTF-8"?>
<controller-info>
    <!-- For more detailed information on different configurations that an agent can support and the respective rules,
    consult the online documentation. In general, configuration properties may be set in different ways. Here is the
    order of precedence of how the agent will read and respect specific configurations.
      1. Environment Variables
      2. System Properties
      3. Default/Root controller-info.xml. See .../$(Agent-Base-Install-Dir)/conf/controller-info.xml -->

    <!-- This is the host name or the IP address of the AppDynamics Controller (e.g., 192.168.1.22 or myhost or
    myhost.abc.com). This is the same host that you use to access the AppDynamics browser-based User interface. This can
    be overridden with the environment variable 'CONTROLLER_HOST_NAME' or the system property
    '-Dappdynamics.controller.hostName' -->
    <controller-host>medpro.saas.appdynamics.com</controller-host>

    <!-- This is the http(s) port of the AppDynamics Controller. If 'controller-ssl-enabled' (below) is set to true, you
    must specify the HTTPS port of the Controller; otherwise, specify the HTTP port. The default values are 8090 for
    HTTP and 8181 for HTTPS. This is the same port that you use to access the AppDynamics browser-based User interface.
    This can be overridden with the environment variable 'APPDYNAMICS_CONTROLLER_PORT' or the system property
    '-Dappdynamics.controller.port' -->
    <controller-port>443</controller-port>

    <!-- This specifies if the AppDynamics agent should use SSL (HTTPS) to connect to the Controller. If you set this to
    true, the controller port property above should be set to the HTTPS port of the Controller. This can be overridden
    with the environment variable 'APPDYNAMICS_CONTROLLER_SSL_ENABLED' or the system property
    '-Dappdynamics.controller.ssl.enabled' -->
    <controller-ssl-enabled>true</controller-ssl-enabled>

    <!-- Set this flag to 'true' to enable features required for AppDynamics Orchestration, including the following:
    1) Enables the agent to execute tasks specified in AppDynamics Orchestration workflows.
    2) Enables the agent to resolve the AppDynamics Controller host and port when the host machine where this agent
       resides is created through AppDynamics Orchestration. -->
    <enable-orchestration>false</enable-orchestration>

    <!-- The Machine Agent uses the Java API to get the host name of the agent. The results from the API can be
    inconsistent, and the same JVM can sometimes return a different value for the same machine each time the machine
    agent is restarted. It is recommended to set this field in the following scenarios:

    1) The machine host name is not constant
    2) You prefer to use a specific name in the UI
    3) The machine has both a machine agent and app agents on it.

    This can be overridden with the environment variable 'APPDYNAMICS_AGENT_UNIQUE_HOST_ID' or the system property
    '-Dappdynamics.agent.uniqueHostId' -->
    <unique-host-id></unique-host-id>

    <!-- This key is generated at installation time and can be found by viewing the license information in the
    controller settings. This can be overridden with the environment variable 'APPDYNAMICS_AGENT_ACCOUNT_ACCESS_KEY' or
    the system property '-Dappdynamics.agent.accountAccessKey' -->
    <account-access-key>1ovg9ek842xl</account-access-key>

    <!-- If the AppDynamics Controller is running in multi-tenant mode or you are using the AppDynamics SaaS Controller,
    you must specify the account name for this agent to authenticate with the controller. If you are running in
    single-tenant mode (the default) there is no need to configure this value. This can be overridden with the
    environment variable 'APPDYNAMICS_AGENT_ACCOUNT_NAME' or the system property '-Dappdynamics.agent.accountName' -->
    <account-name>medpro</account-name>

    <!-- If this agent is licensed for Server Monitoring, set this flag to 'true' to enable Server Monitoring expanded
    metrics. This can be overridden with the environment variable 'APPDYNAMICS_SIM_ENABLED' or the system property
    '-Dappdynamics.sim.enabled' -->
    <sim-enabled>true</sim-enabled>

    <!-- This value is used to create the hierarchy infrastructure view in the UI for this machine. Each hierarchy level
    should be separated with a vertical bar ("|"). For example, if this machine belongs to "DataRack1" and it is located
    in "Virginia Data Center", then the machine path could be set to "Virginia Data Center|DataRack1|Machine1" and the
    UI will display it in that hierarchy ("Virginia Data Center|DataRack1"). The last element of the path indicates the
    server name (e.g., "Machine1") and appears as the name on the servers list in the UI. This can be overridden with
    the environment variable 'APPDYNAMICS_MACHINE_HIERARCHY_PATH' or the system property
    '-Dappdynamics.machine.agent.hierarchyPath'.

    Note: The number of characters up to but not including the last vertical bar must not exceed 95. -->
    <machine-path></machine-path>

</controller-info>
EOF