import React, { useState, useEffect } from 'react';
import { getCategories, getProducts } from '../services/api';
import OrdersAdmin from '../components/admin/OrdersAdmin';
import '../styles/Admin.css';

const API_URL = process.env.REACT_APP_API_URL || 'http://localhost:8080';

function Admin() {
    const [activeTab, setActiveTab] = useState('products');
    const [categories, setCategories] = useState([]);
    const [products, setProducts] = useState([]);

    // ─── Crear producto ───────────────────────────────────
    const [createLoading, setCreateLoading]   = useState(false);
    const [createSuccess, setCreateSuccess]   = useState(null);
    const [createError, setCreateError]       = useState(null);
    const [createPreviews, setCreatePreviews] = useState([]);
    const [formData, setFormData] = useState({
        name: '', brand: '', price: '', categoryId: '', description: '', images: []
    });

    // ─── Añadir imágenes a producto existente ─────────────
    const [updateId, setUpdateId]             = useState('');
    const [updateFiles, setUpdateFiles]       = useState([]);
    const [updatePreviews, setUpdatePreviews] = useState([]);
    const [updateLoading, setUpdateLoading]   = useState(false);
    const [updateSuccess, setUpdateSuccess]   = useState(null);
    const [updateError, setUpdateError]       = useState(null);
    const [existingImages, setExistingImages] = useState([]);

    useEffect(() => {
        getCategories().then(r => setCategories(r.data)).catch(console.error);
        getProducts().then(r => setProducts(r.data)).catch(console.error);
    }, []);

    // Cargar imágenes existentes al seleccionar producto
    useEffect(() => {
        if (!updateId) { setExistingImages([]); return; }
        fetch(`${API_URL}/api/products/${updateId}/images`)
            .then(r => r.json())
            .then(setExistingImages)
            .catch(console.error);
    }, [updateId]);

    const reloadProducts = () =>
        getProducts().then(r => setProducts(r.data)).catch(console.error);

    // ─── Handlers crear ───────────────────────────────────
    const handleChange = (e) =>
        setFormData({ ...formData, [e.target.name]: e.target.value });

    const handleCreateImages = (e) => {
        const files = Array.from(e.target.files);
        setFormData({ ...formData, images: files });
        setCreatePreviews(files.map(f => URL.createObjectURL(f)));
    };

    const handleCreate = async (e) => {
        e.preventDefault();
        setCreateError(null);
        setCreateSuccess(null);
        if (formData.images.length === 0) { setCreateError('Selecciona al menos una imagen.'); return; }
        setCreateLoading(true);
        try {
            const data = new FormData();
            data.append('name',        formData.name);
            data.append('brand',       formData.brand);
            data.append('price',       formData.price);
            data.append('categoryId',  formData.categoryId);
            data.append('description', formData.description);
            formData.images.forEach(img => data.append('images', img));

            const token = localStorage.getItem('token');
            const res = await fetch(`${API_URL}/api/products`, {
                method: 'POST',
                headers: { 'Authorization': `Bearer ${token}` },
                body: data,
            });
            if (!res.ok) { const e = await res.json(); throw new Error(e.error); }
            const product = await res.json();
            setCreateSuccess(`✅ Producto "${product.name}" creado con ${formData.images.length} imagen(es).`);
            setFormData({ name: '', brand: '', price: '', categoryId: '', description: '', images: [] });
            setCreatePreviews([]);
            reloadProducts();
        } catch (err) {
            setCreateError(err.message);
        } finally {
            setCreateLoading(false);
        }
    };

    // ─── Handlers actualizar imágenes ─────────────────────
    const handleUpdateFiles = (e) => {
        const files = Array.from(e.target.files);
        setUpdateFiles(files);
        setUpdatePreviews(files.map(f => URL.createObjectURL(f)));
    };

    const handleUpdate = async (e) => {
        e.preventDefault();
        setUpdateError(null);
        setUpdateSuccess(null);
        if (!updateId)             { setUpdateError('Selecciona un producto.'); return; }
        if (updateFiles.length === 0) { setUpdateError('Selecciona al menos una imagen.'); return; }
        setUpdateLoading(true);
        try {
            const data = new FormData();
            updateFiles.forEach(img => data.append('images', img));

            const token = localStorage.getItem('token');
            const res = await fetch(`${API_URL}/api/products/${updateId}/images`, {
                method: 'POST',
                headers: { 'Authorization': `Bearer ${token}` },
                body: data,
            });
            if (!res.ok) { const e = await res.json(); throw new Error(e.error); }
            const allImages = await res.json();
            setExistingImages(allImages);
            const p = products.find(p => p.id === parseInt(updateId));
            setUpdateSuccess(`✅ ${updateFiles.length} imagen(es) añadidas a "${p?.name}".`);
            setUpdateFiles([]);
            setUpdatePreviews([]);
        } catch (err) {
            setUpdateError(err.message);
        } finally {
            setUpdateLoading(false);
        }
    };

    const handleDeleteImage = async (imageId) => {
        if (!window.confirm('¿Eliminar esta imagen?')) return;
        const token = localStorage.getItem('token');
        await fetch(`${API_URL}/api/products/images/${imageId}`, {
            method: 'DELETE',
            headers: { 'Authorization': `Bearer ${token}` },
        });
        setExistingImages(prev => prev.filter(i => i.id !== imageId));
    };

    const selectedProduct = products.find(p => p.id === parseInt(updateId));

    return (
        <div className="admin">
            <div className="admin__header">
                <h1 className="admin__title">Admin</h1>
                <p className="admin__subtitle">Panel de administración — StreetShop</p>
            </div>

            {/* Pestañas */}
            <div className="admin__tabs">
                <button
                    onClick={() => setActiveTab('products')}
                    className={`admin__tab ${activeTab === 'products' ? 'admin__tab--active' : ''}`}
                >
                    Productos
                </button>
                <button
                    onClick={() => setActiveTab('orders')}
                    className={`admin__tab ${activeTab === 'orders' ? 'admin__tab--active' : ''}`}
                >
                    Pedidos
                </button>
            </div>

            {/* Contenido según pestaña activa */}
            {activeTab === 'products' && (
                <>
                    {/* ─── Gestionar imágenes de producto existente ─── */}
                    <div className="admin__card">
                        <h2 className="admin__card-title">Gestionar imágenes</h2>
                        <form onSubmit={handleUpdate} className="admin__form">
                            {updateSuccess && <div className="admin__success">{updateSuccess}</div>}
                            {updateError   && <div className="admin__error">{updateError}</div>}

                            <div className="admin__group">
                                <label className="admin__label">Producto</label>
                                <select
                                    value={updateId}
                                    onChange={e => { setUpdateId(e.target.value); setUpdateFiles([]); setUpdatePreviews([]); }}
                                    className="admin__select"
                                >
                                    <option value="">Selecciona un producto</option>
                                    {products.map(p => (
                                        <option key={p.id} value={p.id}>[{p.id}] {p.brand} — {p.name}</option>
                                    ))}
                                </select>
                            </div>

                            {/* Imágenes actuales */}
                            {selectedProduct && (
                                <div className="admin__group">
                                    <label className="admin__label">
                                        Imágenes actuales ({existingImages.length})
                                    </label>
                                    {existingImages.length === 0 ? (
                                        <p className="admin__no-image">Sin imágenes</p>
                                    ) : (
                                        <div className="admin__existing-grid">
                                            {existingImages.map(img => (
                                                <div key={img.id} className="admin__existing-item">
                                                    <img src={img.imageUrl} alt="" className="admin__existing-img" />
                                                    {img.isPrimary && <span className="admin__primary-badge">Principal</span>}
                                                    <button
                                                        type="button"
                                                        onClick={() => handleDeleteImage(img.id)}
                                                        className="admin__delete-img-btn"
                                                    >✕</button>
                                                </div>
                                            ))}
                                        </div>
                                    )}
                                </div>
                            )}

                            {/* Nuevas imágenes */}
                            <div className="admin__group">
                                <label className="admin__label">Añadir imágenes</label>
                                <div className="admin__image-upload">
                                    <input type="file" accept="image/*" multiple onChange={handleUpdateFiles} />
                                    {updatePreviews.length === 0 ? (
                                        <>
                                            <div className="admin__image-icon">🖼️</div>
                                            <p className="admin__image-hint">Haz clic para seleccionar una o varias imágenes</p>
                                        </>
                                    ) : (
                                        <div className="admin__preview-grid">
                                            {updatePreviews.map((src, i) => (
                                                <img key={i} src={src} alt="" className="admin__preview-thumb" />
                                            ))}
                                        </div>
                                    )}
                                </div>
                            </div>

                            <button type="submit" disabled={updateLoading} className="admin__submit-btn">
                                {updateLoading ? 'Subiendo...' : 'Añadir imágenes'}
                            </button>
                        </form>
                    </div>

                    {/* ─── Crear nuevo producto ─── */}
                    <div className="admin__card">
                        <h2 className="admin__card-title">Nuevo Producto</h2>
                        <form onSubmit={handleCreate} className="admin__form">
                            {createSuccess && <div className="admin__success">{createSuccess}</div>}
                            {createError   && <div className="admin__error">{createError}</div>}

                            <div className="admin__row">
                                <div className="admin__group">
                                    <label className="admin__label">Nombre</label>
                                    <input type="text" name="name" value={formData.name} onChange={handleChange} required className="admin__input" placeholder="Air Force 1" />
                                </div>
                                <div className="admin__group">
                                    <label className="admin__label">Marca</label>
                                    <input type="text" name="brand" value={formData.brand} onChange={handleChange} required className="admin__input" placeholder="Nike" />
                                </div>
                            </div>

                            <div className="admin__row">
                                <div className="admin__group">
                                    <label className="admin__label">Precio (€)</label>
                                    <input type="number" name="price" value={formData.price} onChange={handleChange} required min="0" step="0.01" className="admin__input" placeholder="129.99" />
                                </div>
                                <div className="admin__group">
                                    <label className="admin__label">Categoría</label>
                                    <select name="categoryId" value={formData.categoryId} onChange={handleChange} required className="admin__select">
                                        <option value="">Selecciona una categoría</option>
                                        {categories.map(cat => (
                                            <option key={cat.id} value={cat.id}>{cat.name}</option>
                                        ))}
                                    </select>
                                </div>
                            </div>

                            <div className="admin__group">
                                <label className="admin__label">Descripción</label>
                                <textarea name="description" value={formData.description} onChange={handleChange} required className="admin__textarea" placeholder="Describe el producto..." />
                            </div>

                            <div className="admin__group">
                                <label className="admin__label">Imágenes del producto</label>
                                <div className="admin__image-upload">
                                    <input type="file" accept="image/*" multiple onChange={handleCreateImages} />
                                    {createPreviews.length === 0 ? (
                                        <>
                                            <div className="admin__image-icon">🖼️</div>
                                            <p className="admin__image-hint">Haz clic para seleccionar una o varias imágenes</p>
                                            <p className="admin__image-hint">La primera imagen será la principal</p>
                                        </>
                                    ) : (
                                        <div className="admin__preview-grid">
                                            {createPreviews.map((src, i) => (
                                                <div key={i} className="admin__preview-item">
                                                    <img src={src} alt="" className="admin__preview-thumb" />
                                                    {i === 0 && <span className="admin__primary-badge">Principal</span>}
                                                </div>
                                            ))}
                                        </div>
                                    )}
                                </div>
                            </div>

                            <button type="submit" disabled={createLoading} className="admin__submit-btn">
                                {createLoading ? 'Creando producto...' : 'Crear Producto'}
                            </button>
                        </form>
                    </div>
                </>
            )}

            {activeTab === 'orders' && <OrdersAdmin />}
        </div>
    );
}

export default Admin;