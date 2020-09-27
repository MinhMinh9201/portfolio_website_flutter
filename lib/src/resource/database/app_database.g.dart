// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Blog extends DataClass implements Insertable<Blog> {
  final String id;
  final String title;
  final String description;
  final String image;
  final int isFromFirebase;
  final String url;
  final DateTime createTime;
  Blog(
      {@required this.id,
      @required this.title,
      @required this.description,
      @required this.image,
      @required this.isFromFirebase,
      @required this.url,
      this.createTime});
  factory Blog.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    return Blog(
      id: stringType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      title:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}title']),
      description: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}description']),
      image:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}image']),
      isFromFirebase: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}is_from_firebase']),
      url: stringType.mapFromDatabaseResponse(data['${effectivePrefix}url']),
      createTime: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}create_time']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<String>(id);
    }
    if (!nullToAbsent || title != null) {
      map['title'] = Variable<String>(title);
    }
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || image != null) {
      map['image'] = Variable<String>(image);
    }
    if (!nullToAbsent || isFromFirebase != null) {
      map['is_from_firebase'] = Variable<int>(isFromFirebase);
    }
    if (!nullToAbsent || url != null) {
      map['url'] = Variable<String>(url);
    }
    if (!nullToAbsent || createTime != null) {
      map['create_time'] = Variable<DateTime>(createTime);
    }
    return map;
  }

  BlogsCompanion toCompanion(bool nullToAbsent) {
    return BlogsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      title:
          title == null && nullToAbsent ? const Value.absent() : Value(title),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      image:
          image == null && nullToAbsent ? const Value.absent() : Value(image),
      isFromFirebase: isFromFirebase == null && nullToAbsent
          ? const Value.absent()
          : Value(isFromFirebase),
      url: url == null && nullToAbsent ? const Value.absent() : Value(url),
      createTime: createTime == null && nullToAbsent
          ? const Value.absent()
          : Value(createTime),
    );
  }

  factory Blog.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Blog(
      id: serializer.fromJson<String>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      description: serializer.fromJson<String>(json['description']),
      image: serializer.fromJson<String>(json['image']),
      isFromFirebase: serializer.fromJson<int>(json['isFromFirebase']),
      url: serializer.fromJson<String>(json['url']),
      createTime: serializer.fromJson<DateTime>(json['createTime']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'title': serializer.toJson<String>(title),
      'description': serializer.toJson<String>(description),
      'image': serializer.toJson<String>(image),
      'isFromFirebase': serializer.toJson<int>(isFromFirebase),
      'url': serializer.toJson<String>(url),
      'createTime': serializer.toJson<DateTime>(createTime),
    };
  }

  Blog copyWith(
          {int id,
          String title,
          String description,
          String image,
          int isFromFirebase,
          String url,
          DateTime createTime}) =>
      Blog(
        id: id ?? this.id,
        title: title ?? this.title,
        description: description ?? this.description,
        image: image ?? this.image,
        isFromFirebase: isFromFirebase ?? this.isFromFirebase,
        url: url ?? this.url,
        createTime: createTime ?? this.createTime,
      );
  @override
  String toString() {
    return (StringBuffer('Blog(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('image: $image, ')
          ..write('isFromFirebase: $isFromFirebase, ')
          ..write('url: $url, ')
          ..write('createTime: $createTime')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          title.hashCode,
          $mrjc(
              description.hashCode,
              $mrjc(
                  image.hashCode,
                  $mrjc(isFromFirebase.hashCode,
                      $mrjc(url.hashCode, createTime.hashCode)))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Blog &&
          other.id == this.id &&
          other.title == this.title &&
          other.description == this.description &&
          other.image == this.image &&
          other.isFromFirebase == this.isFromFirebase &&
          other.url == this.url &&
          other.createTime == this.createTime);
}

class BlogsCompanion extends UpdateCompanion<Blog> {
  final Value<String> id;
  final Value<String> title;
  final Value<String> description;
  final Value<String> image;
  final Value<int> isFromFirebase;
  final Value<String> url;
  final Value<DateTime> createTime;
  const BlogsCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.image = const Value.absent(),
    this.isFromFirebase = const Value.absent(),
    this.url = const Value.absent(),
    this.createTime = const Value.absent(),
  });
  BlogsCompanion.insert({
    this.id = const Value.absent(),
    @required String title,
    @required String description,
    @required String image,
    this.isFromFirebase = const Value.absent(),
    @required String url,
    this.createTime = const Value.absent(),
  })  : title = Value(title),
        description = Value(description),
        image = Value(image),
        url = Value(url);
  static Insertable<Blog> custom({
    Expression<int> id,
    Expression<String> title,
    Expression<String> description,
    Expression<String> image,
    Expression<int> isFromFirebase,
    Expression<String> url,
    Expression<DateTime> createTime,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (image != null) 'image': image,
      if (isFromFirebase != null) 'is_from_firebase': isFromFirebase,
      if (url != null) 'url': url,
      if (createTime != null) 'create_time': createTime,
    });
  }

  BlogsCompanion copyWith(
      {Value<int> id,
      Value<String> title,
      Value<String> description,
      Value<String> image,
      Value<int> isFromFirebase,
      Value<String> url,
      Value<DateTime> createTime}) {
    return BlogsCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      image: image ?? this.image,
      isFromFirebase: isFromFirebase ?? this.isFromFirebase,
      url: url ?? this.url,
      createTime: createTime ?? this.createTime,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (image.present) {
      map['image'] = Variable<String>(image.value);
    }
    if (isFromFirebase.present) {
      map['is_from_firebase'] = Variable<int>(isFromFirebase.value);
    }
    if (url.present) {
      map['url'] = Variable<String>(url.value);
    }
    if (createTime.present) {
      map['create_time'] = Variable<DateTime>(createTime.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BlogsCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('image: $image, ')
          ..write('isFromFirebase: $isFromFirebase, ')
          ..write('url: $url, ')
          ..write('createTime: $createTime')
          ..write(')'))
        .toString();
  }
}

class $BlogsTable extends Blogs with TableInfo<$BlogsTable, Blog> {
  final GeneratedDatabase _db;
  final String _alias;
  $BlogsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedTextColumn _id;
  @override
  GeneratedTextColumn get id => _id ??= _constructId();
  GeneratedTextColumn _constructId() {
    return GeneratedTextColumn('id', $tableName, false);
  }

  final VerificationMeta _titleMeta = const VerificationMeta('title');
  GeneratedTextColumn _title;
  @override
  GeneratedTextColumn get title => _title ??= _constructTitle();
  GeneratedTextColumn _constructTitle() {
    return GeneratedTextColumn(
      'title',
      $tableName,
      false,
    );
  }

  final VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  GeneratedTextColumn _description;
  @override
  GeneratedTextColumn get description =>
      _description ??= _constructDescription();
  GeneratedTextColumn _constructDescription() {
    return GeneratedTextColumn(
      'description',
      $tableName,
      false,
    );
  }

  final VerificationMeta _imageMeta = const VerificationMeta('image');
  GeneratedTextColumn _image;
  @override
  GeneratedTextColumn get image => _image ??= _constructImage();
  GeneratedTextColumn _constructImage() {
    return GeneratedTextColumn(
      'image',
      $tableName,
      false,
    );
  }

  final VerificationMeta _isFromFirebaseMeta =
      const VerificationMeta('isFromFirebase');
  GeneratedIntColumn _isFromFirebase;
  @override
  GeneratedIntColumn get isFromFirebase =>
      _isFromFirebase ??= _constructIsFromFirebase();
  GeneratedIntColumn _constructIsFromFirebase() {
    return GeneratedIntColumn(
      'is_from_firebase',
      $tableName,
      false,
    )..clientDefault = () => 1;
  }

  final VerificationMeta _urlMeta = const VerificationMeta('url');
  GeneratedTextColumn _url;
  @override
  GeneratedTextColumn get url => _url ??= _constructUrl();
  GeneratedTextColumn _constructUrl() {
    return GeneratedTextColumn(
      'url',
      $tableName,
      false,
    );
  }

  final VerificationMeta _createTimeMeta = const VerificationMeta('createTime');
  GeneratedDateTimeColumn _createTime;
  @override
  GeneratedDateTimeColumn get createTime =>
      _createTime ??= _constructCreateTime();
  GeneratedDateTimeColumn _constructCreateTime() {
    return GeneratedDateTimeColumn(
      'create_time',
      $tableName,
      true,
    );
  }

  @override
  List<GeneratedColumn> get $columns =>
      [id, title, description, image, isFromFirebase, url, createTime];
  @override
  $BlogsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'blogs';
  @override
  final String actualTableName = 'blogs';
  @override
  VerificationContext validateIntegrity(Insertable<Blog> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title'], _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description'], _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('image')) {
      context.handle(
          _imageMeta, image.isAcceptableOrUnknown(data['image'], _imageMeta));
    } else if (isInserting) {
      context.missing(_imageMeta);
    }
    if (data.containsKey('is_from_firebase')) {
      context.handle(
          _isFromFirebaseMeta,
          isFromFirebase.isAcceptableOrUnknown(
              data['is_from_firebase'], _isFromFirebaseMeta));
    }
    if (data.containsKey('url')) {
      context.handle(
          _urlMeta, url.isAcceptableOrUnknown(data['url'], _urlMeta));
    } else if (isInserting) {
      context.missing(_urlMeta);
    }
    if (data.containsKey('create_time')) {
      context.handle(
          _createTimeMeta,
          createTime.isAcceptableOrUnknown(
              data['create_time'], _createTimeMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Blog map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Blog.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $BlogsTable createAlias(String alias) {
    return $BlogsTable(_db, alias);
  }
}

class Project extends DataClass implements Insertable<Project> {
  final int id;
  final String name;
  final String description;
  final String image;
  final int isFromFirebase;
  final String url;
  final DateTime createTime;
  Project(
      {@required this.id,
      @required this.name,
      @required this.description,
      @required this.image,
      @required this.isFromFirebase,
      @required this.url,
      this.createTime});
  factory Project.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    return Project(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']),
      description: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}description']),
      image:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}image']),
      isFromFirebase: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}is_from_firebase']),
      url: stringType.mapFromDatabaseResponse(data['${effectivePrefix}url']),
      createTime: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}create_time']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || image != null) {
      map['image'] = Variable<String>(image);
    }
    if (!nullToAbsent || isFromFirebase != null) {
      map['is_from_firebase'] = Variable<int>(isFromFirebase);
    }
    if (!nullToAbsent || url != null) {
      map['url'] = Variable<String>(url);
    }
    if (!nullToAbsent || createTime != null) {
      map['create_time'] = Variable<DateTime>(createTime);
    }
    return map;
  }

  ProjectsCompanion toCompanion(bool nullToAbsent) {
    return ProjectsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      image:
          image == null && nullToAbsent ? const Value.absent() : Value(image),
      isFromFirebase: isFromFirebase == null && nullToAbsent
          ? const Value.absent()
          : Value(isFromFirebase),
      url: url == null && nullToAbsent ? const Value.absent() : Value(url),
      createTime: createTime == null && nullToAbsent
          ? const Value.absent()
          : Value(createTime),
    );
  }

  factory Project.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Project(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String>(json['description']),
      image: serializer.fromJson<String>(json['image']),
      isFromFirebase: serializer.fromJson<int>(json['isFromFirebase']),
      url: serializer.fromJson<String>(json['url']),
      createTime: serializer.fromJson<DateTime>(json['createTime']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String>(description),
      'image': serializer.toJson<String>(image),
      'isFromFirebase': serializer.toJson<int>(isFromFirebase),
      'url': serializer.toJson<String>(url),
      'createTime': serializer.toJson<DateTime>(createTime),
    };
  }

  Project copyWith(
          {int id,
          String name,
          String description,
          String image,
          int isFromFirebase,
          String url,
          DateTime createTime}) =>
      Project(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
        image: image ?? this.image,
        isFromFirebase: isFromFirebase ?? this.isFromFirebase,
        url: url ?? this.url,
        createTime: createTime ?? this.createTime,
      );
  @override
  String toString() {
    return (StringBuffer('Project(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('image: $image, ')
          ..write('isFromFirebase: $isFromFirebase, ')
          ..write('url: $url, ')
          ..write('createTime: $createTime')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          name.hashCode,
          $mrjc(
              description.hashCode,
              $mrjc(
                  image.hashCode,
                  $mrjc(isFromFirebase.hashCode,
                      $mrjc(url.hashCode, createTime.hashCode)))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Project &&
          other.id == this.id &&
          other.name == this.name &&
          other.description == this.description &&
          other.image == this.image &&
          other.isFromFirebase == this.isFromFirebase &&
          other.url == this.url &&
          other.createTime == this.createTime);
}

class ProjectsCompanion extends UpdateCompanion<Project> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> description;
  final Value<String> image;
  final Value<int> isFromFirebase;
  final Value<String> url;
  final Value<DateTime> createTime;
  const ProjectsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.image = const Value.absent(),
    this.isFromFirebase = const Value.absent(),
    this.url = const Value.absent(),
    this.createTime = const Value.absent(),
  });
  ProjectsCompanion.insert({
    this.id = const Value.absent(),
    @required String name,
    @required String description,
    @required String image,
    this.isFromFirebase = const Value.absent(),
    @required String url,
    this.createTime = const Value.absent(),
  })  : name = Value(name),
        description = Value(description),
        image = Value(image),
        url = Value(url);
  static Insertable<Project> custom({
    Expression<int> id,
    Expression<String> name,
    Expression<String> description,
    Expression<String> image,
    Expression<int> isFromFirebase,
    Expression<String> url,
    Expression<DateTime> createTime,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (image != null) 'image': image,
      if (isFromFirebase != null) 'is_from_firebase': isFromFirebase,
      if (url != null) 'url': url,
      if (createTime != null) 'create_time': createTime,
    });
  }

  ProjectsCompanion copyWith(
      {Value<int> id,
      Value<String> name,
      Value<String> description,
      Value<String> image,
      Value<int> isFromFirebase,
      Value<String> url,
      Value<DateTime> createTime}) {
    return ProjectsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      image: image ?? this.image,
      isFromFirebase: isFromFirebase ?? this.isFromFirebase,
      url: url ?? this.url,
      createTime: createTime ?? this.createTime,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (image.present) {
      map['image'] = Variable<String>(image.value);
    }
    if (isFromFirebase.present) {
      map['is_from_firebase'] = Variable<int>(isFromFirebase.value);
    }
    if (url.present) {
      map['url'] = Variable<String>(url.value);
    }
    if (createTime.present) {
      map['create_time'] = Variable<DateTime>(createTime.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProjectsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('image: $image, ')
          ..write('isFromFirebase: $isFromFirebase, ')
          ..write('url: $url, ')
          ..write('createTime: $createTime')
          ..write(')'))
        .toString();
  }
}

class $ProjectsTable extends Projects with TableInfo<$ProjectsTable, Project> {
  final GeneratedDatabase _db;
  final String _alias;
  $ProjectsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedTextColumn _id;
  @override
  GeneratedTextColumn get id => _id ??= _constructId();
  GeneratedTextColumn _constructId() {
    return GeneratedTextColumn('id', $tableName, false);
  }

  final VerificationMeta _nameMeta = const VerificationMeta('name');
  GeneratedTextColumn _name;
  @override
  GeneratedTextColumn get name => _name ??= _constructName();
  GeneratedTextColumn _constructName() {
    return GeneratedTextColumn(
      'name',
      $tableName,
      false,
    );
  }

  final VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  GeneratedTextColumn _description;
  @override
  GeneratedTextColumn get description =>
      _description ??= _constructDescription();
  GeneratedTextColumn _constructDescription() {
    return GeneratedTextColumn(
      'description',
      $tableName,
      false,
    );
  }

  final VerificationMeta _imageMeta = const VerificationMeta('image');
  GeneratedTextColumn _image;
  @override
  GeneratedTextColumn get image => _image ??= _constructImage();
  GeneratedTextColumn _constructImage() {
    return GeneratedTextColumn(
      'image',
      $tableName,
      false,
    );
  }

  final VerificationMeta _isFromFirebaseMeta =
      const VerificationMeta('isFromFirebase');
  GeneratedIntColumn _isFromFirebase;
  @override
  GeneratedIntColumn get isFromFirebase =>
      _isFromFirebase ??= _constructIsFromFirebase();
  GeneratedIntColumn _constructIsFromFirebase() {
    return GeneratedIntColumn(
      'is_from_firebase',
      $tableName,
      false,
    )..clientDefault = () => 1;
  }

  final VerificationMeta _urlMeta = const VerificationMeta('url');
  GeneratedTextColumn _url;
  @override
  GeneratedTextColumn get url => _url ??= _constructUrl();
  GeneratedTextColumn _constructUrl() {
    return GeneratedTextColumn(
      'url',
      $tableName,
      false,
    );
  }

  final VerificationMeta _createTimeMeta = const VerificationMeta('createTime');
  GeneratedDateTimeColumn _createTime;
  @override
  GeneratedDateTimeColumn get createTime =>
      _createTime ??= _constructCreateTime();
  GeneratedDateTimeColumn _constructCreateTime() {
    return GeneratedDateTimeColumn(
      'create_time',
      $tableName,
      true,
    );
  }

  @override
  List<GeneratedColumn> get $columns =>
      [id, name, description, image, isFromFirebase, url, createTime];
  @override
  $ProjectsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'projects';
  @override
  final String actualTableName = 'projects';
  @override
  VerificationContext validateIntegrity(Insertable<Project> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name'], _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description'], _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('image')) {
      context.handle(
          _imageMeta, image.isAcceptableOrUnknown(data['image'], _imageMeta));
    } else if (isInserting) {
      context.missing(_imageMeta);
    }
    if (data.containsKey('is_from_firebase')) {
      context.handle(
          _isFromFirebaseMeta,
          isFromFirebase.isAcceptableOrUnknown(
              data['is_from_firebase'], _isFromFirebaseMeta));
    }
    if (data.containsKey('url')) {
      context.handle(
          _urlMeta, url.isAcceptableOrUnknown(data['url'], _urlMeta));
    } else if (isInserting) {
      context.missing(_urlMeta);
    }
    if (data.containsKey('create_time')) {
      context.handle(
          _createTimeMeta,
          createTime.isAcceptableOrUnknown(
              data['create_time'], _createTimeMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Project map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Project.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $ProjectsTable createAlias(String alias) {
    return $ProjectsTable(_db, alias);
  }
}

class Profile extends DataClass implements Insertable<Profile> {
  final String id;
  final String name;
  final String email;
  final String description;
  final String image;
  final String urls;
  final int isDefault;
  final DateTime createTime;
  Profile(
      {@required this.id,
      @required this.name,
      @required this.email,
      this.description,
      this.image,
      this.urls,
      @required this.isDefault,
      this.createTime});
  factory Profile.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    final intType = db.typeSystem.forDartType<int>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    return Profile(
      id: stringType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']),
      email:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}email']),
      description: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}description']),
      image:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}image']),
      urls: stringType.mapFromDatabaseResponse(data['${effectivePrefix}urls']),
      isDefault:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}is_default']),
      createTime: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}create_time']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<String>(id);
    }
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    if (!nullToAbsent || email != null) {
      map['email'] = Variable<String>(email);
    }
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || image != null) {
      map['image'] = Variable<String>(image);
    }
    if (!nullToAbsent || urls != null) {
      map['urls'] = Variable<String>(urls);
    }
    if (!nullToAbsent || isDefault != null) {
      map['is_default'] = Variable<int>(isDefault);
    }
    if (!nullToAbsent || createTime != null) {
      map['create_time'] = Variable<DateTime>(createTime);
    }
    return map;
  }

  ProfilesCompanion toCompanion(bool nullToAbsent) {
    return ProfilesCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      email:
          email == null && nullToAbsent ? const Value.absent() : Value(email),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      image:
          image == null && nullToAbsent ? const Value.absent() : Value(image),
      urls: urls == null && nullToAbsent ? const Value.absent() : Value(urls),
      isDefault: isDefault == null && nullToAbsent
          ? const Value.absent()
          : Value(isDefault),
      createTime: createTime == null && nullToAbsent
          ? const Value.absent()
          : Value(createTime),
    );
  }

  factory Profile.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Profile(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      email: serializer.fromJson<String>(json['email']),
      description: serializer.fromJson<String>(json['description']),
      image: serializer.fromJson<String>(json['image']),
      urls: serializer.fromJson<String>(json['urls']),
      isDefault: serializer.fromJson<int>(json['isDefault']),
      createTime: serializer.fromJson<DateTime>(json['createTime']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'email': serializer.toJson<String>(email),
      'description': serializer.toJson<String>(description),
      'image': serializer.toJson<String>(image),
      'urls': serializer.toJson<String>(urls),
      'isDefault': serializer.toJson<int>(isDefault),
      'createTime': serializer.toJson<DateTime>(createTime),
    };
  }

  Profile copyWith(
          {String id,
          String name,
          String email,
          String description,
          String image,
          String urls,
          int isDefault,
          DateTime createTime}) =>
      Profile(
        id: id ?? this.id,
        name: name ?? this.name,
        email: email ?? this.email,
        description: description ?? this.description,
        image: image ?? this.image,
        urls: urls ?? this.urls,
        isDefault: isDefault ?? this.isDefault,
        createTime: createTime ?? this.createTime,
      );
  @override
  String toString() {
    return (StringBuffer('Profile(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('email: $email, ')
          ..write('description: $description, ')
          ..write('image: $image, ')
          ..write('urls: $urls, ')
          ..write('isDefault: $isDefault, ')
          ..write('createTime: $createTime')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          name.hashCode,
          $mrjc(
              email.hashCode,
              $mrjc(
                  description.hashCode,
                  $mrjc(
                      image.hashCode,
                      $mrjc(urls.hashCode,
                          $mrjc(isDefault.hashCode, createTime.hashCode))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Profile &&
          other.id == this.id &&
          other.name == this.name &&
          other.email == this.email &&
          other.description == this.description &&
          other.image == this.image &&
          other.urls == this.urls &&
          other.isDefault == this.isDefault &&
          other.createTime == this.createTime);
}

class ProfilesCompanion extends UpdateCompanion<Profile> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> email;
  final Value<String> description;
  final Value<String> image;
  final Value<String> urls;
  final Value<int> isDefault;
  final Value<DateTime> createTime;
  const ProfilesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.email = const Value.absent(),
    this.description = const Value.absent(),
    this.image = const Value.absent(),
    this.urls = const Value.absent(),
    this.isDefault = const Value.absent(),
    this.createTime = const Value.absent(),
  });
  ProfilesCompanion.insert({
    @required String id,
    @required String name,
    @required String email,
    this.description = const Value.absent(),
    this.image = const Value.absent(),
    this.urls = const Value.absent(),
    this.isDefault = const Value.absent(),
    this.createTime = const Value.absent(),
  })  : id = Value(id),
        name = Value(name),
        email = Value(email);
  static Insertable<Profile> custom({
    Expression<String> id,
    Expression<String> name,
    Expression<String> email,
    Expression<String> description,
    Expression<String> image,
    Expression<String> urls,
    Expression<int> isDefault,
    Expression<DateTime> createTime,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (email != null) 'email': email,
      if (description != null) 'description': description,
      if (image != null) 'image': image,
      if (urls != null) 'urls': urls,
      if (isDefault != null) 'is_default': isDefault,
      if (createTime != null) 'create_time': createTime,
    });
  }

  ProfilesCompanion copyWith(
      {Value<String> id,
      Value<String> name,
      Value<String> email,
      Value<String> description,
      Value<String> image,
      Value<String> urls,
      Value<int> isDefault,
      Value<DateTime> createTime}) {
    return ProfilesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      description: description ?? this.description,
      image: image ?? this.image,
      urls: urls ?? this.urls,
      isDefault: isDefault ?? this.isDefault,
      createTime: createTime ?? this.createTime,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (image.present) {
      map['image'] = Variable<String>(image.value);
    }
    if (urls.present) {
      map['urls'] = Variable<String>(urls.value);
    }
    if (isDefault.present) {
      map['is_default'] = Variable<int>(isDefault.value);
    }
    if (createTime.present) {
      map['create_time'] = Variable<DateTime>(createTime.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProfilesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('email: $email, ')
          ..write('description: $description, ')
          ..write('image: $image, ')
          ..write('urls: $urls, ')
          ..write('isDefault: $isDefault, ')
          ..write('createTime: $createTime')
          ..write(')'))
        .toString();
  }
}

class $ProfilesTable extends Profiles with TableInfo<$ProfilesTable, Profile> {
  final GeneratedDatabase _db;
  final String _alias;
  $ProfilesTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedTextColumn _id;
  @override
  GeneratedTextColumn get id => _id ??= _constructId();
  GeneratedTextColumn _constructId() {
    return GeneratedTextColumn(
      'id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _nameMeta = const VerificationMeta('name');
  GeneratedTextColumn _name;
  @override
  GeneratedTextColumn get name => _name ??= _constructName();
  GeneratedTextColumn _constructName() {
    return GeneratedTextColumn(
      'name',
      $tableName,
      false,
    );
  }

  final VerificationMeta _emailMeta = const VerificationMeta('email');
  GeneratedTextColumn _email;
  @override
  GeneratedTextColumn get email => _email ??= _constructEmail();
  GeneratedTextColumn _constructEmail() {
    return GeneratedTextColumn(
      'email',
      $tableName,
      false,
    );
  }

  final VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  GeneratedTextColumn _description;
  @override
  GeneratedTextColumn get description =>
      _description ??= _constructDescription();
  GeneratedTextColumn _constructDescription() {
    return GeneratedTextColumn(
      'description',
      $tableName,
      true,
    );
  }

  final VerificationMeta _imageMeta = const VerificationMeta('image');
  GeneratedTextColumn _image;
  @override
  GeneratedTextColumn get image => _image ??= _constructImage();
  GeneratedTextColumn _constructImage() {
    return GeneratedTextColumn(
      'image',
      $tableName,
      true,
    );
  }

  final VerificationMeta _urlsMeta = const VerificationMeta('urls');
  GeneratedTextColumn _urls;
  @override
  GeneratedTextColumn get urls => _urls ??= _constructUrls();
  GeneratedTextColumn _constructUrls() {
    return GeneratedTextColumn(
      'urls',
      $tableName,
      true,
    );
  }

  final VerificationMeta _isDefaultMeta = const VerificationMeta('isDefault');
  GeneratedIntColumn _isDefault;
  @override
  GeneratedIntColumn get isDefault => _isDefault ??= _constructIsDefault();
  GeneratedIntColumn _constructIsDefault() {
    return GeneratedIntColumn(
      'is_default',
      $tableName,
      false,
    )..clientDefault = () => 0;
  }

  final VerificationMeta _createTimeMeta = const VerificationMeta('createTime');
  GeneratedDateTimeColumn _createTime;
  @override
  GeneratedDateTimeColumn get createTime =>
      _createTime ??= _constructCreateTime();
  GeneratedDateTimeColumn _constructCreateTime() {
    return GeneratedDateTimeColumn(
      'create_time',
      $tableName,
      true,
    );
  }

  @override
  List<GeneratedColumn> get $columns =>
      [id, name, email, description, image, urls, isDefault, createTime];
  @override
  $ProfilesTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'profiles';
  @override
  final String actualTableName = 'profiles';
  @override
  VerificationContext validateIntegrity(Insertable<Profile> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name'], _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email'], _emailMeta));
    } else if (isInserting) {
      context.missing(_emailMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description'], _descriptionMeta));
    }
    if (data.containsKey('image')) {
      context.handle(
          _imageMeta, image.isAcceptableOrUnknown(data['image'], _imageMeta));
    }
    if (data.containsKey('urls')) {
      context.handle(
          _urlsMeta, urls.isAcceptableOrUnknown(data['urls'], _urlsMeta));
    }
    if (data.containsKey('is_default')) {
      context.handle(_isDefaultMeta,
          isDefault.isAcceptableOrUnknown(data['is_default'], _isDefaultMeta));
    }
    if (data.containsKey('create_time')) {
      context.handle(
          _createTimeMeta,
          createTime.isAcceptableOrUnknown(
              data['create_time'], _createTimeMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Profile map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Profile.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $ProfilesTable createAlias(String alias) {
    return $ProfilesTable(_db, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $BlogsTable _blogs;
  $BlogsTable get blogs => _blogs ??= $BlogsTable(this);
  $ProjectsTable _projects;
  $ProjectsTable get projects => _projects ??= $ProjectsTable(this);
  $ProfilesTable _profiles;
  $ProfilesTable get profiles => _profiles ??= $ProfilesTable(this);
  BlogDao _blogDao;
  BlogDao get blogDao => _blogDao ??= BlogDao(this as AppDatabase);
  ProjectDao _projectDao;
  ProjectDao get projectDao => _projectDao ??= ProjectDao(this as AppDatabase);
  ProfileDao _profileDao;
  ProfileDao get profileDao => _profileDao ??= ProfileDao(this as AppDatabase);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [blogs, projects, profiles];
}
