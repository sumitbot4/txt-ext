import os

# Telegram API credentials
API_ID = int(os.environ["API_ID"])
API_HASH = os.environ["API_HASH"]
BOT_TOKEN = os.environ["BOT_TOKEN"]

# Bot owner and credit info
OWNER = int(os.environ["OWNER"])
CREDIT = os.environ.get("CREDIT", "𝙎𝘼𝙄𝙉𝙄 𝘽𝙊𝙏𝙎")

# Authorized users
TOTAL_USERS = [int(user_id) for user_id in os.environ.get('TOTAL_USERS', '').split(',') if user_id]
AUTH_USERS = [int(user_id) for user_id in os.environ.get('AUTH_USERS', '').split(',') if user_id]

# Ensure OWNER is always authorized
if OWNER not in AUTH_USERS:
    AUTH_USERS.append(OWNER)
