-- ============================================================
-- SyncSpace Creator Hub - Database Schema
-- PostgreSQL 14+ compatible
-- ============================================================

-- ============================================================
-- ENUM TYPES
-- ============================================================

CREATE TYPE platform_type AS ENUM ('YouTube', 'Instagram');

CREATE TYPE content_status AS ENUM ('Scraped', 'Draft', 'Scheduled', 'Published');

-- ============================================================
-- TABLE: creators
-- Core table storing creator profiles and channel metadata
-- ============================================================

CREATE TABLE creators (
    id                SERIAL PRIMARY KEY,
    name              VARCHAR(150) NOT NULL,
    platform          platform_type NOT NULL,
    channel_url       TEXT NOT NULL,
    profile_image_url TEXT,
    subscriber_count  INTEGER DEFAULT 0,
    created_at        TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

COMMENT ON TABLE creators IS 'Stores creator profiles linked to YouTube or Instagram channels';
COMMENT ON COLUMN creators.subscriber_count IS 'Latest known subscriber/follower count at time of scrape';

-- ============================================================
-- TABLE: scraped_videos
-- Stores video metadata extracted from YouTube scraping sessions
-- ============================================================

CREATE TABLE scraped_videos (
    id                 SERIAL PRIMARY KEY,
    creator_id         INTEGER NOT NULL REFERENCES creators(id) ON DELETE CASCADE,
    video_title        VARCHAR(500) NOT NULL,
    view_count         INTEGER DEFAULT 0,
    upload_date        DATE,
    thumbnail_url      TEXT,
    engagement_metric  DECIMAL(5,2) DEFAULT 0.00,
    created_at         TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

COMMENT ON TABLE scraped_videos IS 'Video data captured from YouTube scraping operations';
COMMENT ON COLUMN scraped_videos.engagement_metric IS 'Calculated engagement rate as a percentage (likes+comments / views * 100)';

CREATE INDEX idx_scraped_videos_creator ON scraped_videos(creator_id);
CREATE INDEX idx_scraped_videos_views ON scraped_videos(view_count DESC);

-- ============================================================
-- TABLE: content_planner
-- Scheduling and planning entries for upcoming content
-- ============================================================

CREATE TABLE content_planner (
    id                   SERIAL PRIMARY KEY,
    creator_id           INTEGER NOT NULL REFERENCES creators(id) ON DELETE CASCADE,
    platform             platform_type NOT NULL,
    scheduled_date       DATE NOT NULL,
    caption_hook         TEXT NOT NULL,
    associated_media_path TEXT,
    status               content_status NOT NULL DEFAULT 'Draft',
    created_at           TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

COMMENT ON TABLE content_planner IS 'Content scheduling entries with platform targeting and status tracking';
COMMENT ON COLUMN content_planner.caption_hook IS 'The opening hook or caption text for the planned post';
COMMENT ON COLUMN content_planner.associated_media_path IS 'File path or URL to the associated media asset';

CREATE INDEX idx_content_planner_creator ON content_planner(creator_id);
CREATE INDEX idx_content_planner_date ON content_planner(scheduled_date);
CREATE INDEX idx_content_planner_status ON content_planner(status);

-- ============================================================
-- SEED DATA: creators
-- ============================================================

INSERT INTO creators (name, platform, channel_url, profile_image_url, subscriber_count) VALUES
    ('TechVault Studios', 'YouTube', 'https://youtube.com/@techvaultstudios', 'https://i.pravatar.cc/150?u=techvault', 1450000),
    ('Aria Wellness', 'Instagram', 'https://instagram.com/ariawellness', 'https://i.pravatar.cc/150?u=ariawellness', 820000),
    ('CodeCraft Academy', 'YouTube', 'https://youtube.com/@codecraftacademy', 'https://i.pravatar.cc/150?u=codecraft', 2100000);

-- ============================================================
-- SEED DATA: scraped_videos
-- ============================================================

INSERT INTO scraped_videos (creator_id, video_title, view_count, upload_date, thumbnail_url, engagement_metric) VALUES
    (1, 'I Built a Mass Surveillance Detector for $20', 1840000, '2025-01-15', 'https://img.youtube.com/vi/abc123/maxresdefault.jpg', 8.42),
    (1, 'This AI Tool Replaces Your Entire Dev Team', 2100000, '2025-02-01', 'https://img.youtube.com/vi/def456/maxresdefault.jpg', 9.17),
    (1, 'Why Every Programmer Needs a Home Lab', 890000, '2025-02-20', 'https://img.youtube.com/vi/ghi789/maxresdefault.jpg', 6.33),
    (3, 'Master React in 45 Minutes - No Fluff Guide', 3200000, '2025-01-08', 'https://img.youtube.com/vi/jkl012/maxresdefault.jpg', 11.24),
    (3, 'System Design Interview: The Only Video You Need', 2750000, '2025-01-22', 'https://img.youtube.com/vi/mno345/maxresdefault.jpg', 10.01),
    (3, 'I Mass-Applied to 500 Jobs Using Python Automation', 1920000, '2025-02-10', 'https://img.youtube.com/vi/pqr678/maxresdefault.jpg', 7.89),
    (3, 'Why PostgreSQL Destroys MongoDB for 99% of Apps', 1450000, '2025-03-01', 'https://img.youtube.com/vi/stu901/maxresdefault.jpg', 8.55),
    (1, 'Homelab Tour 2025: $5000 Budget Breakdown', 1200000, '2025-03-10', 'https://img.youtube.com/vi/vwx234/maxresdefault.jpg', 7.12);

-- ============================================================
-- SEED DATA: content_planner
-- ============================================================

INSERT INTO content_planner (creator_id, platform, scheduled_date, caption_hook, associated_media_path, status) VALUES
    (1, 'YouTube', '2025-04-01', 'You are being watched. Here is how to detect it with a Raspberry Pi...', '/media/surveillance-detector-v2.mp4', 'Scheduled'),
    (2, 'Instagram', '2025-04-02', 'Morning routine that changed my cortisol levels forever', '/media/morning-routine-reel.mp4', 'Draft'),
    (2, 'Instagram', '2025-04-04', 'The 3 supplements your doctor will never prescribe (but should)', '/media/supplements-carousel.zip', 'Draft'),
    (3, 'YouTube', '2025-04-05', 'FAANG rejected me 12 times. Here is what finally worked...', '/media/faang-journey.mp4', 'Scheduled'),
    (1, 'Instagram', '2025-04-07', 'POV: Your home lab costs more than your car', '/media/homelab-meme.jpg', 'Published'),
    (3, 'YouTube', '2025-04-10', 'Build a Full SaaS in 48 Hours - Live Coding Challenge', '/media/saas-challenge-stream.mp4', 'Scraped');

-- ============================================================
-- VERIFICATION QUERIES (commented - for manual testing)
-- ============================================================

-- SELECT * FROM creators;
-- SELECT sv.video_title, sv.view_count, c.name FROM scraped_videos sv JOIN creators c ON sv.creator_id = c.id ORDER BY sv.view_count DESC;
-- SELECT cp.caption_hook, cp.platform, cp.status, c.name FROM content_planner cp JOIN creators c ON cp.creator_id = c.id ORDER BY cp.scheduled_date;
