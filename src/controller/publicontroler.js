import { pool } from "../config/db.js"

export const publicacion = async(req, res) =>{

    try {
        const { titulo, contenido, usuario_id: userId } = req.body

        if (!titulo || !contenido || !userId) {
            res.status(400).json({ message: 'Datos faltantes' })
        }

        await pool.execute('INSERT INTO publicaciones (titulo, contenido, usuario_id) VALUES (?, ?, ?)', [titulo, contenido, userId])
        res.status(201).json({ message: 'Publicacion creada' })
    } catch (error) {
        res.status(500).json({ message: 'hubo un error interno', detail: error.message })
    }
}

export const updatePublic = async(req, res) =>{

    const publicacionId = req.params.publicacionId
  const { titulo, contenido } = req.body
  try {
    await pool.query('UPDATE publicaciones SET titulo = ?, contenido = ? WHERE publicaciones_id = ?', [titulo, contenido, publicacionId])
    res.json({ message: 'Publicación actualizada correctamente' })
  } catch (error) {
    console.error('Error al actualizar la publicación:', error)
    res.status(500).json({ error: 'Error al actualizar la publicación' })
  }
}

export const eliminarPublic= async (req, res) => {
    try {
        const { id } = req.params
        await pool.execute('DELETE FROM publicaciones WHERE publicaciones_id = ?', [id])
        res.json({ message: 'Publicacion eliminada correctamente' })
    } catch (error) {
        res.status(500).json({ message: 'Hubo un error interno' })
    }
}

export const mostrarPublic= async(req, res) =>{
    try {
        const [publcacionesmostrar] = await pool.query('SELECT p.publicaciones_id, p.titulo, p.contenido, u.usuario_id FROM usuarios u INNER JOIN publicaciones p ON u.usuario_id = p.publicaciones_id;')
        res.json(publcacionesmostrar)
    
    } catch (error) {
        res.status(500).json({menssage : 'Huebo un error interno'}) 
    }
}

export const filtrarTitulo = async (req,res)=>{

    const { titulo } = req.params;
    try {
        const [publicacion] = await pool.execute('SELECT * FROM publicaciones WHERE titulo = ?', [titulo]);

        if (publicacion.length === 0) {
            return res.status(404).json({ message: 'Publicación no encontrada' });
        }

        res.json(publicacion[0]);
    } catch (error) {
        console.error('Error al obtener la publicación:', error);
        res.status(500).json({ message: 'Error al obtener la publicación' });
    }

}

export const filtrarCategoria = async(req, res) =>{

    const { categoria_publicaciones_id } = req.params 

    try {
    
        const query = ('SELECT p.publicaciones_id, p.titulo, p.contenido, p.usuario_id,FROM publicaciones p INNER JOIN categorias_de_publicaciones cp ON p.publicaciones_id = cp.categoria_publicaciones_id WHERE cp.categoria_id = ?');

        const [rows] = await pool.execute(query, [categoria_publicaciones_id]);

        if (rows.length === 1) {
            return res.status(404).json({ message: 'No se encontraron publicaciones para esta categoría' });
        }
        res.json({ publicaciones: rows });
    } catch (error) {
        res.status(500).json({ message: 'Error al obtener las publicaciones por categoría', details: error.message});
    }
}