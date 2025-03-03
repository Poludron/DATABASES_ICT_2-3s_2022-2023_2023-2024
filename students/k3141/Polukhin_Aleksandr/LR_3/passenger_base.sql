PGDMP  .    #                {         	   Passenger    16.0    16.0 9    G           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            H           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            I           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            J           1262    16600 	   Passenger    DATABASE        CREATE DATABASE "Passenger" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251';
    DROP DATABASE "Passenger";
                postgres    false                        2615    16601 	   passenger    SCHEMA        CREATE SCHEMA passenger;
    DROP SCHEMA passenger;
                postgres    false            �            1259    16605 	   carriages    TABLE     �   CREATE TABLE passenger.carriages (
    carriage_id bigint NOT NULL,
    carriage_directory_id bigint NOT NULL,
    carriage_serial_number bigint NOT NULL,
    CONSTRAINT carriage_serial_number_0_check CHECK ((carriage_serial_number > 0))
);
     DROP TABLE passenger.carriages;
    	   passenger         heap    postgres    false    6            �            1259    16608    carriages_directory    TABLE     B  CREATE TABLE passenger.carriages_directory (
    carriage_directory_id bigint NOT NULL,
    services character varying(40) NOT NULL,
    vendor character varying(40),
    number_of_seats bigint NOT NULL,
    name_carriage_type character varying(40),
    CONSTRAINT number_of_seats_0_check CHECK ((number_of_seats > 0))
);
 *   DROP TABLE passenger.carriages_directory;
    	   passenger         heap    postgres    false    6            �            1259    16632    offices    TABLE     x   CREATE TABLE passenger.offices (
    offices_id bigint NOT NULL,
    offices_address character varying(100) NOT NULL
);
    DROP TABLE passenger.offices;
    	   passenger         heap    postgres    false    6            �            1259    16629 
   passengers    TABLE     �  CREATE TABLE passenger.passengers (
    passenger_id bigint NOT NULL,
    name character varying(40) NOT NULL,
    surname character varying(40) NOT NULL,
    middle_name character varying(40) NOT NULL,
    document_serial bigint NOT NULL,
    document_number bigint NOT NULL,
    document_date date,
    document_organisation character varying(40),
    CONSTRAINT document_number_check CHECK ((document_number > 0)),
    CONSTRAINT document_serial_check CHECK ((document_serial > 0))
);
 !   DROP TABLE passenger.passengers;
    	   passenger         heap    postgres    false    6            �            1259    16602    seats    TABLE     0  CREATE TABLE passenger.seats (
    seat_id bigint NOT NULL,
    seat_number bigint NOT NULL,
    price money NOT NULL,
    seat_type character varying(40) NOT NULL,
    tier integer NOT NULL,
    floor integer NOT NULL,
    trip_id bigint,
    CONSTRAINT seat_number_0_check CHECK ((seat_number > 0))
);
    DROP TABLE passenger.seats;
    	   passenger         heap    postgres    false    6            �            1259    16617    stations    TABLE     �   CREATE TABLE passenger.stations (
    station_id bigint NOT NULL,
    station_number bigint NOT NULL,
    stop_duration bigint NOT NULL,
    train_id bigint NOT NULL,
    stations_directory_id bigint NOT NULL
);
    DROP TABLE passenger.stations;
    	   passenger         heap    postgres    false    6            �            1259    16620    stations_directory    TABLE     �   CREATE TABLE passenger.stations_directory (
    station_address character varying(100) NOT NULL,
    station_name character varying(40) NOT NULL,
    station_directory_id_fk bigint NOT NULL
);
 )   DROP TABLE passenger.stations_directory;
    	   passenger         heap    postgres    false    6            �            1259    16626    tickets    TABLE     �  CREATE TABLE passenger.tickets (
    carriage_number bigint NOT NULL,
    seat_number bigint NOT NULL,
    ticket_id bigint NOT NULL,
    passenger_id bigint NOT NULL,
    departure_city character varying(40) NOT NULL,
    offices_id bigint NOT NULL,
    departure_time time with time zone NOT NULL,
    arrival_time time with time zone NOT NULL,
    buying_format character varying(10) NOT NULL,
    arrival_city character varying(40) NOT NULL
);
    DROP TABLE passenger.tickets;
    	   passenger         heap    postgres    false    6            �            1259    16743 	   timetable    TABLE     �  CREATE TABLE passenger.timetable (
    timetable_id bigint NOT NULL,
    train_id bigint NOT NULL,
    status character varying(40) NOT NULL,
    departure_time time with time zone NOT NULL,
    arrival_time time with time zone NOT NULL,
    trip_id bigint,
    CONSTRAINT status_check CHECK (((status)::text = ANY (ARRAY[('scheduled'::character varying)::text, ('canceled'::character varying)::text, ('departured'::character varying)::text])))
);
     DROP TABLE passenger.timetable;
    	   passenger         heap    postgres    false    6            �            1259    16614    trains    TABLE     �  CREATE TABLE passenger.trains (
    train_type character varying(40) NOT NULL,
    train_name character varying(40) NOT NULL,
    departure_time time with time zone NOT NULL,
    arrival_time time with time zone NOT NULL,
    train_id bigint NOT NULL,
    train_number bigint NOT NULL,
    since_date date,
    until_date date,
    CONSTRAINT departure_time_and_arrival_time_check CHECK ((departure_time < arrival_time)),
    CONSTRAINT train_number_0_check CHECK ((train_number > 0)),
    CONSTRAINT train_type_check CHECK (((train_type)::text = ANY (ARRAY[('suburban'::character varying)::text, ('high_speed'::character varying)::text, ('long_distance'::character varying)::text])))
);
    DROP TABLE passenger.trains;
    	   passenger         heap    postgres    false    6            �            1259    16611    trips    TABLE     _   CREATE TABLE passenger.trips (
    trip_id bigint NOT NULL,
    carriage_id bigint NOT NULL
);
    DROP TABLE passenger.trips;
    	   passenger         heap    postgres    false    6            ;          0    16605 	   carriages 
   TABLE DATA           b   COPY passenger.carriages (carriage_id, carriage_directory_id, carriage_serial_number) FROM stdin;
 	   passenger          postgres    false    217   'M       <          0    16608    carriages_directory 
   TABLE DATA           ~   COPY passenger.carriages_directory (carriage_directory_id, services, vendor, number_of_seats, name_carriage_type) FROM stdin;
 	   passenger          postgres    false    218   ^M       C          0    16632    offices 
   TABLE DATA           A   COPY passenger.offices (offices_id, offices_address) FROM stdin;
 	   passenger          postgres    false    225   �M       B          0    16629 
   passengers 
   TABLE DATA           �   COPY passenger.passengers (passenger_id, name, surname, middle_name, document_serial, document_number, document_date, document_organisation) FROM stdin;
 	   passenger          postgres    false    224   )N       :          0    16602    seats 
   TABLE DATA           `   COPY passenger.seats (seat_id, seat_number, price, seat_type, tier, floor, trip_id) FROM stdin;
 	   passenger          postgres    false    216   �N       ?          0    16617    stations 
   TABLE DATA           q   COPY passenger.stations (station_id, station_number, stop_duration, train_id, stations_directory_id) FROM stdin;
 	   passenger          postgres    false    221   LO       @          0    16620    stations_directory 
   TABLE DATA           g   COPY passenger.stations_directory (station_address, station_name, station_directory_id_fk) FROM stdin;
 	   passenger          postgres    false    222   �O       A          0    16626    tickets 
   TABLE DATA           �   COPY passenger.tickets (carriage_number, seat_number, ticket_id, passenger_id, departure_city, offices_id, departure_time, arrival_time, buying_format, arrival_city) FROM stdin;
 	   passenger          postgres    false    223   1P       D          0    16743 	   timetable 
   TABLE DATA           m   COPY passenger.timetable (timetable_id, train_id, status, departure_time, arrival_time, trip_id) FROM stdin;
 	   passenger          postgres    false    226   �P       >          0    16614    trains 
   TABLE DATA           �   COPY passenger.trains (train_type, train_name, departure_time, arrival_time, train_id, train_number, since_date, until_date) FROM stdin;
 	   passenger          postgres    false    220   4Q       =          0    16611    trips 
   TABLE DATA           8   COPY passenger.trips (trip_id, carriage_id) FROM stdin;
 	   passenger          postgres    false    219   �Q       ~           2606    16806    tickets buying_format_ckeck    CHECK CONSTRAINT     �   ALTER TABLE passenger.tickets
    ADD CONSTRAINT buying_format_ckeck CHECK (((buying_format)::text = ANY (ARRAY[('online'::character varying)::text, ('ofline'::character varying)::text]))) NOT VALID;
 C   ALTER TABLE passenger.tickets DROP CONSTRAINT buying_format_ckeck;
    	   passenger          postgres    false    223    223            �           2606    16674    carriages carriages_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY passenger.carriages
    ADD CONSTRAINT carriages_pkey PRIMARY KEY (carriage_id);
 E   ALTER TABLE ONLY passenger.carriages DROP CONSTRAINT carriages_pkey;
    	   passenger            postgres    false    217            �           2606    16671 (   carriages_directory carriages_types_pkey 
   CONSTRAINT     |   ALTER TABLE ONLY passenger.carriages_directory
    ADD CONSTRAINT carriages_types_pkey PRIMARY KEY (carriage_directory_id);
 U   ALTER TABLE ONLY passenger.carriages_directory DROP CONSTRAINT carriages_types_pkey;
    	   passenger            postgres    false    218            �           2606    16679    offices cash_registers_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY passenger.offices
    ADD CONSTRAINT cash_registers_pkey PRIMARY KEY (offices_id);
 H   ALTER TABLE ONLY passenger.offices DROP CONSTRAINT cash_registers_pkey;
    	   passenger            postgres    false    225            �           2606    16662    passengers passengers_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY passenger.passengers
    ADD CONSTRAINT passengers_pkey PRIMARY KEY (passenger_id);
 G   ALTER TABLE ONLY passenger.passengers DROP CONSTRAINT passengers_pkey;
    	   passenger            postgres    false    224            �           2606    16692    seats seats_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY passenger.seats
    ADD CONSTRAINT seats_pkey PRIMARY KEY (seat_id);
 =   ALTER TABLE ONLY passenger.seats DROP CONSTRAINT seats_pkey;
    	   passenger            postgres    false    216            �           2606    16828 ,   stations_directory station_directory_id_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY passenger.stations_directory
    ADD CONSTRAINT station_directory_id_pkey PRIMARY KEY (station_directory_id_fk);
 Y   ALTER TABLE ONLY passenger.stations_directory DROP CONSTRAINT station_directory_id_pkey;
    	   passenger            postgres    false    222            �           2606    16710    stations stations_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY passenger.stations
    ADD CONSTRAINT stations_pkey PRIMARY KEY (station_id);
 C   ALTER TABLE ONLY passenger.stations DROP CONSTRAINT stations_pkey;
    	   passenger            postgres    false    221            �           2606    16682    tickets tickets_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY passenger.tickets
    ADD CONSTRAINT tickets_pkey PRIMARY KEY (ticket_id);
 A   ALTER TABLE ONLY passenger.tickets DROP CONSTRAINT tickets_pkey;
    	   passenger            postgres    false    223            �           2606    16748    timetable timetable_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY passenger.timetable
    ADD CONSTRAINT timetable_pkey PRIMARY KEY (timetable_id);
 E   ALTER TABLE ONLY passenger.timetable DROP CONSTRAINT timetable_pkey;
    	   passenger            postgres    false    226            �           2606    16664    trains train_number 
   CONSTRAINT     Y   ALTER TABLE ONLY passenger.trains
    ADD CONSTRAINT train_number UNIQUE (train_number);
 @   ALTER TABLE ONLY passenger.trains DROP CONSTRAINT train_number;
    	   passenger            postgres    false    220            �           2606    16669    trains trains_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY passenger.trains
    ADD CONSTRAINT trains_pkey PRIMARY KEY (train_id);
 ?   ALTER TABLE ONLY passenger.trains DROP CONSTRAINT trains_pkey;
    	   passenger            postgres    false    220            �           2606    16685    trips trip_id_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY passenger.trips
    ADD CONSTRAINT trip_id_pkey PRIMARY KEY (trip_id);
 ?   ALTER TABLE ONLY passenger.trips DROP CONSTRAINT trip_id_pkey;
    	   passenger            postgres    false    219            �           1259    16675    fki_carriage_directory_id_fk    INDEX     �   CREATE INDEX fki_carriage_directory_id_fk ON passenger.carriages USING btree (carriage_directory_id) WITH (deduplicate_items='false');
 3   DROP INDEX passenger.fki_carriage_directory_id_fk;
    	   passenger            postgres    false    217            �           1259    16859    fki_office_id_fk    INDEX     n   CREATE INDEX fki_office_id_fk ON passenger.tickets USING btree (offices_id) WITH (deduplicate_items='false');
 '   DROP INDEX passenger.fki_office_id_fk;
    	   passenger            postgres    false    223            �           1259    16860    fki_pessenger_id_fk    INDEX     s   CREATE INDEX fki_pessenger_id_fk ON passenger.tickets USING btree (passenger_id) WITH (deduplicate_items='false');
 *   DROP INDEX passenger.fki_pessenger_id_fk;
    	   passenger            postgres    false    223            �           1259    16861    fki_seat_id_fk    INDEX     m   CREATE INDEX fki_seat_id_fk ON passenger.tickets USING btree (seat_number) WITH (deduplicate_items='false');
 %   DROP INDEX passenger.fki_seat_id_fk;
    	   passenger            postgres    false    223            �           1259    16862    fki_station_id_fk    INDEX     p   CREATE INDEX fki_station_id_fk ON passenger.stations USING btree (station_id) WITH (deduplicate_items='false');
 (   DROP INDEX passenger.fki_station_id_fk;
    	   passenger            postgres    false    221            �           1259    16863    fki_train_id_fk    INDEX     l   CREATE INDEX fki_train_id_fk ON passenger.stations USING btree (train_id) WITH (deduplicate_items='false');
 &   DROP INDEX passenger.fki_train_id_fk;
    	   passenger            postgres    false    221            �           2606    16686 "   carriages carriage_directory_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY passenger.carriages
    ADD CONSTRAINT carriage_directory_id_fk FOREIGN KEY (carriage_directory_id) REFERENCES passenger.carriages_directory(carriage_directory_id);
 O   ALTER TABLE ONLY passenger.carriages DROP CONSTRAINT carriage_directory_id_fk;
    	   passenger          postgres    false    217    218    4744            �           2606    16732    trips carriage_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY passenger.trips
    ADD CONSTRAINT carriage_id_fk FOREIGN KEY (carriage_id) REFERENCES passenger.carriages(carriage_id);
 A   ALTER TABLE ONLY passenger.trips DROP CONSTRAINT carriage_id_fk;
    	   passenger          postgres    false    219    217    4741            �           2606    16704    tickets offices_register_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY passenger.tickets
    ADD CONSTRAINT offices_register_id_fk FOREIGN KEY (offices_id) REFERENCES passenger.offices(offices_id) NOT VALID;
 K   ALTER TABLE ONLY passenger.tickets DROP CONSTRAINT offices_register_id_fk;
    	   passenger          postgres    false    223    4765    225            �           2606    16699    tickets passenger_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY passenger.tickets
    ADD CONSTRAINT passenger_id_fk FOREIGN KEY (passenger_id) REFERENCES passenger.passengers(passenger_id);
 D   ALTER TABLE ONLY passenger.tickets DROP CONSTRAINT passenger_id_fk;
    	   passenger          postgres    false    224    223    4763            �           2606    16694    tickets seat_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY passenger.tickets
    ADD CONSTRAINT seat_id_fk FOREIGN KEY (seat_number) REFERENCES passenger.seats(seat_id);
 ?   ALTER TABLE ONLY passenger.tickets DROP CONSTRAINT seat_id_fk;
    	   passenger          postgres    false    4739    216    223            �           2606    16829     stations station_directory_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY passenger.stations
    ADD CONSTRAINT station_directory_id_fk FOREIGN KEY (stations_directory_id) REFERENCES passenger.stations_directory(station_directory_id_fk);
 M   ALTER TABLE ONLY passenger.stations DROP CONSTRAINT station_directory_id_fk;
    	   passenger          postgres    false    4756    221    222            �           2606    16754    timetable train_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY passenger.timetable
    ADD CONSTRAINT train_id_fk FOREIGN KEY (train_id) REFERENCES passenger.trains(train_id);
 B   ALTER TABLE ONLY passenger.timetable DROP CONSTRAINT train_id_fk;
    	   passenger          postgres    false    226    4750    220            �           2606    16834    stations train_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY passenger.stations
    ADD CONSTRAINT train_id_fk FOREIGN KEY (train_id) REFERENCES passenger.trains(train_id);
 A   ALTER TABLE ONLY passenger.stations DROP CONSTRAINT train_id_fk;
    	   passenger          postgres    false    220    221    4750            �           2606    16759    seats trip_id_fk    FK CONSTRAINT     z   ALTER TABLE ONLY passenger.seats
    ADD CONSTRAINT trip_id_fk FOREIGN KEY (trip_id) REFERENCES passenger.trips(trip_id);
 =   ALTER TABLE ONLY passenger.seats DROP CONSTRAINT trip_id_fk;
    	   passenger          postgres    false    4746    216    219            �           2606    16822    timetable trip_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY passenger.timetable
    ADD CONSTRAINT trip_id_fkey FOREIGN KEY (trip_id) REFERENCES passenger.trips(trip_id) NOT VALID;
 C   ALTER TABLE ONLY passenger.timetable DROP CONSTRAINT trip_id_fkey;
    	   passenger          postgres    false    4746    226    219            9           0    16602    seats    ROW SECURITY     6   ALTER TABLE passenger.seats ENABLE ROW LEVEL SECURITY;       	   passenger          postgres    false    216            ;   '   x��I  �w�j���u�E�4�0��C���~J�(      <   l   x�]�M@0F�ߜ�Z?��H�E�J:X8�
"����7Z�X�D�����'�L�E�hpƎpǀ�_�2?<Ǎ_�T���@�j%ؿ�2�U���+P��&%�<@      C   ?   x�3���/N�/�2�N��+���2��/��K���2��O���2����I�+������ �_�      B   �   x�����0����\�a4�������@	�5�}~kI��ݗK��?��3Ӣ}?C�{�����>���F ��(3sT\��3;�G!�yK�
%ˤ}9�dN �F��H޶��J�8�54fM�z�m:±�1Wr�8��ey�y���{c�XE�      :   e   x�m̱�0D��< �IA�"4��@TL�,L�#(ѕ��D!���k���M�!�`&��9�S܊	��/��k��i\�>�DY��=�H!$      ?   3   x����0��75L`�N�a��M���0i
�t�A)�~�M�;/9�ַ$���      @   �   x�M�A
� D�z� �iO�m�BW�H**PI1��	�v70�ff�8��CZ������R����^y�u���l��&gr�g�Ao5������
�	2���O��f܍
>K����rrfNDf��8�*���w�F�Q���ZJ�MF1      A   �   x�U��
�@D�ɯ�%�tA�� ��h����*~}C�ڕ�L��d�un��ڟ*��Z��H���4���=��FO]����S{�J��!h�W�^��jl��}n�
P��?��CO���K�,o]�#���T�8�7�      D   [   x�M�K
�0E�q�A�i�'�8�j�/�g���g߼ �5��x6�&d`8��=�_��nP(~�z��J�FS��eD���%      >   �   x�u�[
�0���VJ�<��YKA�#-F�_�FK�����ķ��ë�+�\�V�"^P��##$��rEZ�חꆾɫ6L�/kX�ʍY-�0��(0�3��T��y,����'3�9�@���⏥:���Oh�ޡ�j�!�S&�,���eƜW�(��R��R�      =      x�3�4�2�4�2�4�2�4����� A�     