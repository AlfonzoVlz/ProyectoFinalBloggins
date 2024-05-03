import { pool } from "../config/db.js";


export const categorias = async (req, res) => {

    const { usuario_id: usuarioId } = req.body
    try {


        const [user] = await pool.execute('SELECT * FROM usuarios WHERE usuario_id = ?', [usuarioId])

        if (user.length === 0 || user[0].rol_id !== 2) {

            res.status(403).json({ message: 'Acceso no permitido' })
        }
        const [usuarioLista] = await pool.query('SELECT * FROM categorias')
        res.json(usuarioLista)


    } catch (error) {
        res.status(500).json({ message: 'Hubo un error interno', details: error.message })
    }



}

export const createAdmi = async (req, res) => {

    try {
        const { categoria_nombre: nombre } = req.body

        if (!nombre) {
            res.status(400).json({ message: 'Datos faltantes' })
        }

        await pool.execute('INSERT INTO categorias (categoria_nombre) VALUES (?)', [nombre])
        res.status(201).json({ message: 'Usuario creado' })
    } catch (error) {
        res.status(500).json({ message: 'hubo un error interno', detail: error.message })
    }
   
};

export const actualizarAdmi = async (req, res) =>{
    try {
        const { id } = req.params

        if (!id) return res.status(400).json({ message: 'No se reconoce al usuario' })

        const { categoria_nombre: nombre } = req.body

        if (!nombre) {
            return res.status(400).json({ message: 'Datos faltantes' })
        }

        await pool.execute('UPDATE categorias SET categoria_nombre = ?', [nombre, id])
        res.status(201).json({ message: 'Usuario Actualizado' })
    } catch (error) {
        res.status(500).json({ message: 'hubo un error interno', detail: error.message })
    }
}

export const admiEliminar = async(req, res) =>{
    try {
        const { id } = req.params
        await pool.execute('DELETE FROM categorias WHERE categoria_id = ?', [id])
        res.json({ message: 'Usuario Eliminado correctamente' })
    } catch (error) {
        res.status(500).json({ message: 'Hubo un error interno' })
    }
}
