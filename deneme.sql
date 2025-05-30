PGDMP     "    #                {            deneme    15.3    15.3 =    d           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            e           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            f           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            g           1262    16715    deneme    DATABASE     �   CREATE DATABASE deneme WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = icu LOCALE = 'en_US.UTF-8' ICU_LOCALE = 'en-US';
    DROP DATABASE deneme;
                postgres    false            �            1259    16819    akademisyen    TABLE     �   CREATE TABLE public.akademisyen (
    ak_no bigint NOT NULL,
    ak_tc bigint NOT NULL,
    ak_ad character varying(20) NOT NULL,
    ak_soyad character varying(20) NOT NULL,
    ak_sifre character varying(25) NOT NULL
);
    DROP TABLE public.akademisyen;
       public         heap    postgres    false            �            1259    16803    bolum    TABLE     j   CREATE TABLE public.bolum (
    bolum_no integer NOT NULL,
    bolum_ad character varying(50) NOT NULL
);
    DROP TABLE public.bolum;
       public         heap    postgres    false            �            1259    16802    bolum_bolum_no_seq    SEQUENCE     �   CREATE SEQUENCE public.bolum_bolum_no_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.bolum_bolum_no_seq;
       public          postgres    false    215            h           0    0    bolum_bolum_no_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.bolum_bolum_no_seq OWNED BY public.bolum.bolum_no;
          public          postgres    false    214            �            1259    16824    ders    TABLE     �   CREATE TABLE public.ders (
    ders_no integer NOT NULL,
    ders_ad character varying(40) NOT NULL,
    ak_no bigint NOT NULL,
    bolum_no integer NOT NULL
);
    DROP TABLE public.ders;
       public         heap    postgres    false            �            1259    16840    ders_ogrenci    TABLE     �   CREATE TABLE public.ders_ogrenci (
    ders_ogrenci_id integer NOT NULL,
    ogr_no bigint NOT NULL,
    ders_no bigint NOT NULL
);
     DROP TABLE public.ders_ogrenci;
       public         heap    postgres    false            �            1259    16839 !   ders_ogrenci_ders_orgrenci_id_seq    SEQUENCE     �   CREATE SEQUENCE public.ders_ogrenci_ders_orgrenci_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.ders_ogrenci_ders_orgrenci_id_seq;
       public          postgres    false    220            i           0    0 !   ders_ogrenci_ders_orgrenci_id_seq    SEQUENCE OWNED BY     f   ALTER SEQUENCE public.ders_ogrenci_ders_orgrenci_id_seq OWNED BY public.ders_ogrenci.ders_ogrenci_id;
          public          postgres    false    219            �            1259    17157    ders_yoklama    TABLE     ~   CREATE TABLE public.ders_yoklama (
    yok_id integer NOT NULL,
    ders_no integer,
    ogr_no integer,
    hafta integer
);
     DROP TABLE public.ders_yoklama;
       public         heap    postgres    false            �            1259    17156    ders_yoklama_yok_id_seq    SEQUENCE     �   CREATE SEQUENCE public.ders_yoklama_yok_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.ders_yoklama_yok_id_seq;
       public          postgres    false    226            j           0    0    ders_yoklama_yok_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.ders_yoklama_yok_id_seq OWNED BY public.ders_yoklama.yok_id;
          public          postgres    false    225            �            1259    16809    ogrenci    TABLE     $  CREATE TABLE public.ogrenci (
    ogr_no bigint NOT NULL,
    ogr_tc bigint NOT NULL,
    ogr_ad character varying(20) NOT NULL,
    ogr_soyad character varying(20) NOT NULL,
    bolum_no integer,
    ogr_eposta character varying(40) NOT NULL,
    ogr_sifre character varying(25) NOT NULL
);
    DROP TABLE public.ogrenci;
       public         heap    postgres    false            �            1259    16857    qr    TABLE     0  CREATE TABLE public.qr (
    qr_no integer NOT NULL,
    ak_konum_x integer NOT NULL,
    ak_konum_y integer NOT NULL,
    hafta integer NOT NULL,
    ders_no integer NOT NULL,
    ak_no bigint NOT NULL,
    bolum_no integer NOT NULL,
    tarih date NOT NULL,
    saat time without time zone NOT NULL
);
    DROP TABLE public.qr;
       public         heap    postgres    false            �            1259    16856    qr_qr_no_seq    SEQUENCE     �   CREATE SEQUENCE public.qr_qr_no_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.qr_qr_no_seq;
       public          postgres    false    222            k           0    0    qr_qr_no_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.qr_qr_no_seq OWNED BY public.qr.qr_no;
          public          postgres    false    221            �            1259    16879    yoklama    TABLE     �   CREATE TABLE public.yoklama (
    yok_no integer NOT NULL,
    ders_no integer NOT NULL,
    hafta integer NOT NULL,
    ak_no bigint NOT NULL,
    bolum_no integer NOT NULL
);
    DROP TABLE public.yoklama;
       public         heap    postgres    false            �            1259    16878    yoklama_yok_no_seq    SEQUENCE     �   CREATE SEQUENCE public.yoklama_yok_no_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.yoklama_yok_no_seq;
       public          postgres    false    224            l           0    0    yoklama_yok_no_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.yoklama_yok_no_seq OWNED BY public.yoklama.yok_no;
          public          postgres    false    223            �           2604    16806    bolum bolum_no    DEFAULT     p   ALTER TABLE ONLY public.bolum ALTER COLUMN bolum_no SET DEFAULT nextval('public.bolum_bolum_no_seq'::regclass);
 =   ALTER TABLE public.bolum ALTER COLUMN bolum_no DROP DEFAULT;
       public          postgres    false    214    215    215            �           2604    16843    ders_ogrenci ders_ogrenci_id    DEFAULT     �   ALTER TABLE ONLY public.ders_ogrenci ALTER COLUMN ders_ogrenci_id SET DEFAULT nextval('public.ders_ogrenci_ders_orgrenci_id_seq'::regclass);
 K   ALTER TABLE public.ders_ogrenci ALTER COLUMN ders_ogrenci_id DROP DEFAULT;
       public          postgres    false    220    219    220            �           2604    17160    ders_yoklama yok_id    DEFAULT     z   ALTER TABLE ONLY public.ders_yoklama ALTER COLUMN yok_id SET DEFAULT nextval('public.ders_yoklama_yok_id_seq'::regclass);
 B   ALTER TABLE public.ders_yoklama ALTER COLUMN yok_id DROP DEFAULT;
       public          postgres    false    226    225    226            �           2604    16860    qr qr_no    DEFAULT     d   ALTER TABLE ONLY public.qr ALTER COLUMN qr_no SET DEFAULT nextval('public.qr_qr_no_seq'::regclass);
 7   ALTER TABLE public.qr ALTER COLUMN qr_no DROP DEFAULT;
       public          postgres    false    222    221    222            �           2604    16882    yoklama yok_no    DEFAULT     p   ALTER TABLE ONLY public.yoklama ALTER COLUMN yok_no SET DEFAULT nextval('public.yoklama_yok_no_seq'::regclass);
 =   ALTER TABLE public.yoklama ALTER COLUMN yok_no DROP DEFAULT;
       public          postgres    false    223    224    224            X          0    16819    akademisyen 
   TABLE DATA           N   COPY public.akademisyen (ak_no, ak_tc, ak_ad, ak_soyad, ak_sifre) FROM stdin;
    public          postgres    false    217   H       V          0    16803    bolum 
   TABLE DATA           3   COPY public.bolum (bolum_no, bolum_ad) FROM stdin;
    public          postgres    false    215   rH       Y          0    16824    ders 
   TABLE DATA           A   COPY public.ders (ders_no, ders_ad, ak_no, bolum_no) FROM stdin;
    public          postgres    false    218   �H       [          0    16840    ders_ogrenci 
   TABLE DATA           H   COPY public.ders_ogrenci (ders_ogrenci_id, ogr_no, ders_no) FROM stdin;
    public          postgres    false    220   0I       a          0    17157    ders_yoklama 
   TABLE DATA           F   COPY public.ders_yoklama (yok_id, ders_no, ogr_no, hafta) FROM stdin;
    public          postgres    false    226   wI       W          0    16809    ogrenci 
   TABLE DATA           e   COPY public.ogrenci (ogr_no, ogr_tc, ogr_ad, ogr_soyad, bolum_no, ogr_eposta, ogr_sifre) FROM stdin;
    public          postgres    false    216   �I       ]          0    16857    qr 
   TABLE DATA           i   COPY public.qr (qr_no, ak_konum_x, ak_konum_y, hafta, ders_no, ak_no, bolum_no, tarih, saat) FROM stdin;
    public          postgres    false    222   �J       _          0    16879    yoklama 
   TABLE DATA           J   COPY public.yoklama (yok_no, ders_no, hafta, ak_no, bolum_no) FROM stdin;
    public          postgres    false    224   �J       m           0    0    bolum_bolum_no_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.bolum_bolum_no_seq', 1, false);
          public          postgres    false    214            n           0    0 !   ders_ogrenci_ders_orgrenci_id_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.ders_ogrenci_ders_orgrenci_id_seq', 10, true);
          public          postgres    false    219            o           0    0    ders_yoklama_yok_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.ders_yoklama_yok_id_seq', 5, true);
          public          postgres    false    225            p           0    0    qr_qr_no_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.qr_qr_no_seq', 1, false);
          public          postgres    false    221            q           0    0    yoklama_yok_no_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.yoklama_yok_no_seq', 1, false);
          public          postgres    false    223            �           2606    16823    akademisyen akademisyen_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.akademisyen
    ADD CONSTRAINT akademisyen_pkey PRIMARY KEY (ak_no);
 F   ALTER TABLE ONLY public.akademisyen DROP CONSTRAINT akademisyen_pkey;
       public            postgres    false    217            �           2606    16808    bolum bolum_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.bolum
    ADD CONSTRAINT bolum_pkey PRIMARY KEY (bolum_no);
 :   ALTER TABLE ONLY public.bolum DROP CONSTRAINT bolum_pkey;
       public            postgres    false    215            �           2606    16845    ders_ogrenci ders_ogrenci_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.ders_ogrenci
    ADD CONSTRAINT ders_ogrenci_pkey PRIMARY KEY (ders_ogrenci_id);
 H   ALTER TABLE ONLY public.ders_ogrenci DROP CONSTRAINT ders_ogrenci_pkey;
       public            postgres    false    220            �           2606    16828    ders ders_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY public.ders
    ADD CONSTRAINT ders_pkey PRIMARY KEY (ders_no);
 8   ALTER TABLE ONLY public.ders DROP CONSTRAINT ders_pkey;
       public            postgres    false    218            �           2606    17162    ders_yoklama ders_yoklama_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.ders_yoklama
    ADD CONSTRAINT ders_yoklama_pkey PRIMARY KEY (yok_id);
 H   ALTER TABLE ONLY public.ders_yoklama DROP CONSTRAINT ders_yoklama_pkey;
       public            postgres    false    226            �           2606    16813    ogrenci ogrenci_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.ogrenci
    ADD CONSTRAINT ogrenci_pkey PRIMARY KEY (ogr_no);
 >   ALTER TABLE ONLY public.ogrenci DROP CONSTRAINT ogrenci_pkey;
       public            postgres    false    216            �           2606    16862 
   qr qr_pkey 
   CONSTRAINT     K   ALTER TABLE ONLY public.qr
    ADD CONSTRAINT qr_pkey PRIMARY KEY (qr_no);
 4   ALTER TABLE ONLY public.qr DROP CONSTRAINT qr_pkey;
       public            postgres    false    222            �           2606    16884    yoklama yoklama_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.yoklama
    ADD CONSTRAINT yoklama_pkey PRIMARY KEY (yok_no);
 >   ALTER TABLE ONLY public.yoklama DROP CONSTRAINT yoklama_pkey;
       public            postgres    false    224            �           2606    16829    ders ders_ak_no_fkey    FK CONSTRAINT     z   ALTER TABLE ONLY public.ders
    ADD CONSTRAINT ders_ak_no_fkey FOREIGN KEY (ak_no) REFERENCES public.akademisyen(ak_no);
 >   ALTER TABLE ONLY public.ders DROP CONSTRAINT ders_ak_no_fkey;
       public          postgres    false    217    3503    218            �           2606    16834    ders ders_bolum_no_fkey    FK CONSTRAINT     }   ALTER TABLE ONLY public.ders
    ADD CONSTRAINT ders_bolum_no_fkey FOREIGN KEY (bolum_no) REFERENCES public.bolum(bolum_no);
 A   ALTER TABLE ONLY public.ders DROP CONSTRAINT ders_bolum_no_fkey;
       public          postgres    false    3499    218    215            �           2606    16851 &   ders_ogrenci ders_ogrenci_ders_no_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.ders_ogrenci
    ADD CONSTRAINT ders_ogrenci_ders_no_fkey FOREIGN KEY (ders_no) REFERENCES public.ders(ders_no);
 P   ALTER TABLE ONLY public.ders_ogrenci DROP CONSTRAINT ders_ogrenci_ders_no_fkey;
       public          postgres    false    218    3505    220            �           2606    16846 %   ders_ogrenci ders_ogrenci_ogr_no_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.ders_ogrenci
    ADD CONSTRAINT ders_ogrenci_ogr_no_fkey FOREIGN KEY (ogr_no) REFERENCES public.ogrenci(ogr_no);
 O   ALTER TABLE ONLY public.ders_ogrenci DROP CONSTRAINT ders_ogrenci_ogr_no_fkey;
       public          postgres    false    216    220    3501            �           2606    17163 &   ders_yoklama ders_yoklama_ders_no_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.ders_yoklama
    ADD CONSTRAINT ders_yoklama_ders_no_fkey FOREIGN KEY (ders_no) REFERENCES public.ders(ders_no);
 P   ALTER TABLE ONLY public.ders_yoklama DROP CONSTRAINT ders_yoklama_ders_no_fkey;
       public          postgres    false    218    3505    226            �           2606    17168 %   ders_yoklama ders_yoklama_ogr_no_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.ders_yoklama
    ADD CONSTRAINT ders_yoklama_ogr_no_fkey FOREIGN KEY (ogr_no) REFERENCES public.ogrenci(ogr_no);
 O   ALTER TABLE ONLY public.ders_yoklama DROP CONSTRAINT ders_yoklama_ogr_no_fkey;
       public          postgres    false    216    226    3501            �           2606    16814    ogrenci ogrenci_bolum_no_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.ogrenci
    ADD CONSTRAINT ogrenci_bolum_no_fkey FOREIGN KEY (bolum_no) REFERENCES public.bolum(bolum_no);
 G   ALTER TABLE ONLY public.ogrenci DROP CONSTRAINT ogrenci_bolum_no_fkey;
       public          postgres    false    215    216    3499            �           2606    16868    qr qr_ak_no_fkey    FK CONSTRAINT     v   ALTER TABLE ONLY public.qr
    ADD CONSTRAINT qr_ak_no_fkey FOREIGN KEY (ak_no) REFERENCES public.akademisyen(ak_no);
 :   ALTER TABLE ONLY public.qr DROP CONSTRAINT qr_ak_no_fkey;
       public          postgres    false    222    3503    217            �           2606    16873    qr qr_bolum_no_fkey    FK CONSTRAINT     y   ALTER TABLE ONLY public.qr
    ADD CONSTRAINT qr_bolum_no_fkey FOREIGN KEY (bolum_no) REFERENCES public.bolum(bolum_no);
 =   ALTER TABLE ONLY public.qr DROP CONSTRAINT qr_bolum_no_fkey;
       public          postgres    false    3499    222    215            �           2606    16863    qr qr_ders_no_fkey    FK CONSTRAINT     u   ALTER TABLE ONLY public.qr
    ADD CONSTRAINT qr_ders_no_fkey FOREIGN KEY (ders_no) REFERENCES public.ders(ders_no);
 <   ALTER TABLE ONLY public.qr DROP CONSTRAINT qr_ders_no_fkey;
       public          postgres    false    3505    222    218            �           2606    16890    yoklama yoklama_ak_no_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.yoklama
    ADD CONSTRAINT yoklama_ak_no_fkey FOREIGN KEY (ak_no) REFERENCES public.akademisyen(ak_no);
 D   ALTER TABLE ONLY public.yoklama DROP CONSTRAINT yoklama_ak_no_fkey;
       public          postgres    false    3503    224    217            �           2606    16895    yoklama yoklama_bolum_no_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.yoklama
    ADD CONSTRAINT yoklama_bolum_no_fkey FOREIGN KEY (bolum_no) REFERENCES public.bolum(bolum_no);
 G   ALTER TABLE ONLY public.yoklama DROP CONSTRAINT yoklama_bolum_no_fkey;
       public          postgres    false    224    3499    215            �           2606    16885    yoklama yoklama_ders_no_fkey    FK CONSTRAINT        ALTER TABLE ONLY public.yoklama
    ADD CONSTRAINT yoklama_ders_no_fkey FOREIGN KEY (ders_no) REFERENCES public.ders(ders_no);
 F   ALTER TABLE ONLY public.yoklama DROP CONSTRAINT yoklama_ders_no_fkey;
       public          postgres    false    224    218    3505            X   D   x�3�4N�Ң��DN����b�D0��Șˈ�8}S3rSK��8�2s2����)������� �S�      V      x�3��=�'#5/%�8'3�+F��� N�t      Y   �   x�3���O��Q(�O/J��I�M�4�4�2�tˬ����9}KRsK�|# ߄3,�(�$1)1��F�����RK2s�3���r�R`]����~�a
G6��*8I�#�#��O�u>�l\� rT+�      [   7   x���  ��]"!\���g��
�S��Œ���T�5�h����\˯��E�      a   )   x�3�4�4�4�2�AC.c i�M��F\�`�W� zKL      W   �   x�u�MN�0���)8�E���"��,b��cc�Q�I�� qnA��h�ELXN������)�rxL���N��LX�1A�L������=#�ߙ<�.ad�����=�|�2��=�Al�g�J�M�P�\h4��$A��Q�M�X�c���:�<�I�/��YK�ɺI��t4m:�p'k(�=k?��L�ҡ�*I���dD������,\��Vж�-��U�����@/SQ7��bUU���_      ]      x������ � �      _      x������ � �     