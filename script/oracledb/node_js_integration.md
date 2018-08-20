Follow the instructions in [https://github.com/oracle/node-oracledb](https://github.com/oracle/node-oracledb):
1. Install NodeJS
1. Install Python 2.7.x and add to the system path
1. Install Visual Studio 2015 Community Edition with C++ compilation enabled
1. Install the Oracle instant client 12.x
	1. Add the basic package
	1. Add the SDK package
1. Add `OCI_LIB_DIR=${oracle_instant_client_path}\sdk\lib\msvc` to the environment variables
1. Add `OCI_LIB_DIR=${oracle_instant_client_path}\sdk\include` to the environment variables
1. Execute `npm install oracledb`
1. Use the connection string in the format found in the `tnsnames.ora`
