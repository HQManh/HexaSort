using UnityEngine;

public class SoundControl : MonoBehaviour
{
    public static SoundControl Instance { get; private set; }
    public AudioSource sfx1;
    public AudioSource sfx2;
    public AudioSource sfx3;
    public AudioSource sfx4;
    public AudioSource sfx5;
    public AudioSource sfx6;
    public AudioSource sfx7;
    public AudioSource sfx8;
    public AudioSource sfx9;
    public AudioSource backGroundMusic;

    private void Awake()
    {
        Instance = this;
    }

    public AudioSource PlaySfx(AudioClip clip, float pitch = 1f, bool loop = false, float volume = 1)
    {
        if (GlobalControll.isSound || clip == null)
        {
            return null;
        }
        if (sfx1.isPlaying)
        {
            return PlaySfx2(clip,pitch,loop,volume);
        }
        else
        {
            sfx1.clip = clip;
            sfx1.pitch = pitch;
            sfx1.loop = loop;
            sfx1.volume = volume;
            sfx1.Play();
            return sfx1;
        }
    }

    public AudioSource PlaySfx2(AudioClip clip, float pitch = 1f, bool loop = false, float volume = 1)
    {
        if (GlobalControll.isSound || clip == null)
        {
            return null;
        }
        if (sfx2.isPlaying)
        {
            return PlaySfx3(clip,pitch,loop,volume);
        }
        else
        {
            sfx2.clip = clip;
            sfx2.pitch = pitch;
            sfx2.loop = loop;
            sfx2.volume = volume; 
            sfx2.Play();
            return sfx2;
        }
    }

    public AudioSource PlaySfx3(AudioClip clip, float pitch = 1f, bool loop = false, float volume = 1)
    {
        if (GlobalControll.isSound || clip == null)
        {
            return null;
        }
        if (sfx3.isPlaying)
        {
            return PlaySfx4(clip, pitch,loop,volume);
        }
        else
        {
            sfx3.clip = clip;
            sfx3.pitch = pitch;
            sfx3.loop = loop;
            sfx3.volume = volume;
            sfx3.Play();
            return sfx3;
        }
    }

    public AudioSource PlaySfx4(AudioClip clip, float pitch = 1f, bool loop = false, float volume = 1)
    {
        if (GlobalControll.isSound || clip == null)
        {
            return null;
        }
        if (sfx4.isPlaying)
        {
            return PlaySfx5(clip, pitch,loop,volume);
        }
        else
        {
            sfx4.clip = clip;
            sfx4.pitch = pitch;
            sfx4.loop = loop;
            sfx4.volume = volume;
            sfx4.Play();
            return sfx4;
        }
    }

    public AudioSource PlaySfx5(AudioClip clip, float pitch = 1f, bool loop = false, float volume = 1)
    {
        if (GlobalControll.isSound || clip == null)
        {
            return null;
        }
        if (sfx5.isPlaying)
        {
            return PlaySfx6(clip,pitch,loop,volume);
        }
        else
        {
            sfx5.clip = clip;
            sfx5.pitch = pitch;
            sfx5.loop = loop;
            sfx5.volume = volume;
            sfx5.Play();
            return sfx5;
        }
    }

    public AudioSource PlaySfx6(AudioClip clip, float pitch = 1f, bool loop = false, float volume = 1)
    {
        if (GlobalControll.isSound || clip == null)
        {
            return null;
        }
        if (sfx6.isPlaying)
        {
            return PlaySfx7(clip,pitch,loop,volume);
        }
        else
        {
            sfx6.clip = clip;
            sfx6.pitch = pitch;
            sfx6.loop = loop;
            sfx6.volume = volume;
            sfx6.Play();
            return sfx6;
        }
    }

    public AudioSource PlaySfx7(AudioClip clip, float pitch = 1f, bool loop = false, float volume = 1)
    {
        if (GlobalControll.isSound || clip == null)
        {
            return null;
        }
        if (sfx7.isPlaying)
        {
            return PlaySfx8(clip,pitch,loop,volume);
        }
        else
        {
            sfx7.clip = clip;
            sfx7.pitch = pitch;
            sfx7.loop = loop;
            sfx7.volume = volume;
            sfx7.Play();
            return sfx7;
        }
    }
    public AudioSource PlaySfx8(AudioClip clip, float pitch = 1f, bool loop = false, float volume = 1)
    {
        if (GlobalControll.isSound || clip == null)
        {
            return null;
        }
        if (sfx8.isPlaying)
        {
            return PlaySfx9(clip,pitch,loop,volume);
        }
        else
        {
            sfx8.clip = clip;
            sfx8.pitch = pitch;
            sfx8.loop = loop;
            sfx8.volume = volume;
            sfx8.Play();
            return sfx8;
        }
    }

    public AudioSource PlaySfx9(AudioClip clip, float pitch = 1f, bool loop = false, float volume = 1)
    {
        if (GlobalControll.isSound || clip == null)
        {
            return null;
        }
        sfx9.clip = clip;
        sfx9.pitch = pitch;
        sfx9.loop = loop;
        sfx9.volume = volume;
        sfx9.Play();
        return sfx9;
    }

    public AudioSource PlayBackGroundMusic(AudioClip clip, float pitch = 1f,bool loop = true, float volume = 1)
    {
        backGroundMusic.clip = clip;
        backGroundMusic.pitch = pitch;
        backGroundMusic.loop = loop;
        backGroundMusic.volume = volume;
        backGroundMusic.Play();
        return backGroundMusic;
    }
}
