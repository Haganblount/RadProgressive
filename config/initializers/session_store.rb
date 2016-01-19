Rails.application.config.session_store :active_record_store
ActionDispatch::Session::ActiveRecordStore.session_class = Session