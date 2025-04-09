const ldap = require('ldap');


const login = async (req, res) => {
    const loginData = req.body
    console.log(loginData)
    try {
        const ldapConfig = {
            url: 'ldap://ldap.unah.edu.cu:389',
            bindDN: `cn=${loginData.username}, cn=users, dc=unah, dc=edu, dc=cu`,
            bindCredentials: `${loginData.password}`,
            searchBase: 'cn=users, dc=unah, dc=edu, dc=cu',
        }
        authenticateUser(ldapConfig, (err, result) => {
            console.log("RESULT STATUS", result.success)
            if (err) {
                return res.json({success: false, message: "Credenciales incorrectas"})
            } else if (result.success) {
                const token = jwt.sign({user: loginData}, 'tu_secreto', {expiresIn: '1h'});
                console.log("RESULT MESSAGE", result.message)
                return res.status(200).json({success: true, "token": token, 'role': "client", username: loginData.username, message: "Autenticacion completada"})
            }
        })
    } catch (ldapError) {
        console.log('Error de autenticacion LDAP', ldapError)
    }
}




function authenticateUser(ldapConfig, callback) {
    // Crear un cliente LDAP
    try {
        const client = ldap.createClient({
            url: ldapConfig.url,
            reconnect: true
        });
        console.log("Cliente: ", client)

        // Obtener los datos de conexión LDAP
        const {bindDN, bindCredentials, searchBase} = ldapConfig;


        // Realizar la autenticación
        client.bind(bindDN, bindCredentials, (err) => {
            if (err) {
                console.log("Error en la autenticacion")
                return callback(err, {success: false, message: "ERROR EN LA AUTENTICACION"});
            } else {
                console.log("Se realizo la autenticacion")
                return callback(null, {success: true, message: "USUARIO AUTENTICADO CORRECTAMENTE"})
            }
        });
    } catch (error) {
        return callback(err, {success: false, message: "ERROR EN LA AUTENTICACION"});
    }

}

module.exports = userMethods = {
    login,
};
