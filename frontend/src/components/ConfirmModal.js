import React from 'react';
import '../styles/ConfirmModal.css';

function ConfirmModal({ isOpen, title, message, confirmText = 'Confirmar', cancelText = 'Cancelar', onConfirm, onCancel, danger = true }) {
    if (!isOpen) return null;

    return (
        <div className="confirm-modal__overlay" onClick={onCancel}>
            <div className="confirm-modal" onClick={e => e.stopPropagation()}>
                <h3 className="confirm-modal__title">{title}</h3>
                {message && <p className="confirm-modal__message">{message}</p>}
                <div className="confirm-modal__actions">
                    <button className="confirm-modal__btn confirm-modal__btn--cancel" onClick={onCancel}>
                        {cancelText}
                    </button>
                    <button className={`confirm-modal__btn ${danger ? 'confirm-modal__btn--danger' : 'confirm-modal__btn--confirm'}`} onClick={onConfirm}>
                        {confirmText}
                    </button>
                </div>
            </div>
        </div>
    );
}

export default ConfirmModal;
