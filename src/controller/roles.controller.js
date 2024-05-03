import { pool } from '../config/db.js';

export const filter = async (req, res, next) => {
    const {usuario_id: usuarioId} = req.body

    const [user] = await pool.execute('SELECT * FROM usuarios WHERE usuario_id = ?', [usuarioId])

    if (user[0].length === 0 || user[0].rol_id !== 2) {
        res.status(403).json({message: 'Acceso no permitido'})
    }
    const [usuarioLista] = await pool.query('SELECT * FROM usuarios')
    res.json(usuarioLista)
};