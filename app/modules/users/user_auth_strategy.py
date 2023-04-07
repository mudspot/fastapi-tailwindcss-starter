from fastapi_users import models
from fastapi_users.authentication import JWTStrategy
from fastapi_users.jwt import generate_jwt


class UserAuthStrategy(JWTStrategy):
    async def write_token(self, user: models.UP) -> str:
        data = {
            "user_id": str(user.id),
            "aud": self.token_audience,
            "role": user.role_type,
        }
        return generate_jwt(
            data, self.encode_key, self.lifetime_seconds, algorithm=self.algorithm
        )
