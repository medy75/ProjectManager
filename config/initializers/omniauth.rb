Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, 'AbKZLW3bBnQXGlQafTw2PQ', 'RFl5IImRBrXQkNShTeG6DBkI8tFwJW51I5MUgezxAGI'
  provider :google, 'cvut-project-manager.herokuapp.com', '-M9raMm1-qylQaFE6uxn0dxi'
end