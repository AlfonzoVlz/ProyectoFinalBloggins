import { pool } from '../config/db.js'

export const createUsuario = async (req, res) => {

    try {
        const { usuario_nombre: nombre, email, password, rol_id: rolId } = req.body

        if (!nombre || !email || !password || !rolId) {
            res.status(400).json({ message: 'Datos faltantes' })
        }

        await pool.execute('INSERT INTO usuarios (usuario_nombre, email, password, rol_id) VALUES (?, ?, ?, ?)', [nombre, email, password, rolId])
        res.status(201).json({ message: 'Usuario creado' })
    } catch (error) {
        res.status(500).json({ message: 'hubo un error interno', detail: error.message })
    }

}

export const update = async (req, res) => {
    try {
        const { id } = req.params

        if (!id) return res.status(400).json({ message: 'No se reconoce al usuario' })

        const { usuario_nombre: nombre, email, password, rol_id: rolId } = req.body

        if (!nombre || !email || !password || !rolId) {
            return res.status(400).json({ message: 'Datos faltantes' })
        }

        await pool.execute('UPDATE usuarios SET usuario_nombre = ?, email = ?, password = ?,  rol_id = ? WHERE usuario_id = ?', [nombre, email, password, rolId, id])
        res.status(201).json({ message: 'Usuario Actualizado' })
    } catch (error) {
        res.status(500).json({ message: 'hubo un error interno', detail: error.message })
    }
}

export const eliminarUsuario = async (req, res) => {
    try {
        const { id } = req.params
        await pool.execute('DELETE FROM usuarios WHERE usuario_id = ?', [id])
        res.json({ message: 'Usuario Eliminado correctamente' })
    } catch (error) {
        res.status(500).json({ message: 'Hubo un error interno' })
    }
}

export const admiUsuario = async (req, res) => {
    try {
        const [usuarios] = await pool.query('SELECT u.usuario_id, u.usuario_nombre, u.email, u.password, r.rol_nombres FROM usuarios u INNER JOIN roles r ON u.rol_id = r.rol_id;')
        res.json(usuarios)
    
    } catch (error) {
        res.status(500).json({menssage : 'Huebo un error interno'})
    }
} 