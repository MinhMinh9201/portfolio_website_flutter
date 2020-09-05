// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Blog extends DataClass implements Insertable<Blog> {
  final int id;
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
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
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
  factory Blog.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return Blog(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      description: serializer.fromJson<String>(json['description']),
      image: serializer.fromJson<String>(json['image']),
      isFromFirebase: serializer.fromJson<int>(json['isFromFirebase']),
      url: serializer.fromJson<String>(json['url']),
      createTime: serializer.fromJson<DateTime>(json['createTime']),
    );
  }
  @override
  Map<String, dynamic> toJson(
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return {
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'description': serializer.toJson<String>(description),
      'image': serializer.toJson<String>(image),
      'isFromFirebase': serializer.toJson<int>(isFromFirebase),
      'url': serializer.toJson<String>(url),
      'createTime': serializer.toJson<DateTime>(createTime),
    };
  }

  @override
  BlogsCompanion createCompanion(bool nullToAbsent) {
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
  bool operator ==(other) =>
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
  final Value<int> id;
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
    @required int isFromFirebase,
    @required String url,
    this.createTime = const Value.absent(),
  })  : title = Value(title),
        description = Value(description),
        image = Value(image),
        isFromFirebase = Value(isFromFirebase),
        url = Value(url);
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
}

class $BlogsTable extends Blogs with TableInfo<$BlogsTable, Blog> {
  final GeneratedDatabase _db;
  final String _alias;
  $BlogsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
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
    );
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
  VerificationContext validateIntegrity(BlogsCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.id.present) {
      context.handle(_idMeta, id.isAcceptableValue(d.id.value, _idMeta));
    } else if (id.isRequired && isInserting) {
      context.missing(_idMeta);
    }
    if (d.title.present) {
      context.handle(
          _titleMeta, title.isAcceptableValue(d.title.value, _titleMeta));
    } else if (title.isRequired && isInserting) {
      context.missing(_titleMeta);
    }
    if (d.description.present) {
      context.handle(_descriptionMeta,
          description.isAcceptableValue(d.description.value, _descriptionMeta));
    } else if (description.isRequired && isInserting) {
      context.missing(_descriptionMeta);
    }
    if (d.image.present) {
      context.handle(
          _imageMeta, image.isAcceptableValue(d.image.value, _imageMeta));
    } else if (image.isRequired && isInserting) {
      context.missing(_imageMeta);
    }
    if (d.isFromFirebase.present) {
      context.handle(
          _isFromFirebaseMeta,
          isFromFirebase.isAcceptableValue(
              d.isFromFirebase.value, _isFromFirebaseMeta));
    } else if (isFromFirebase.isRequired && isInserting) {
      context.missing(_isFromFirebaseMeta);
    }
    if (d.url.present) {
      context.handle(_urlMeta, url.isAcceptableValue(d.url.value, _urlMeta));
    } else if (url.isRequired && isInserting) {
      context.missing(_urlMeta);
    }
    if (d.createTime.present) {
      context.handle(_createTimeMeta,
          createTime.isAcceptableValue(d.createTime.value, _createTimeMeta));
    } else if (createTime.isRequired && isInserting) {
      context.missing(_createTimeMeta);
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
  Map<String, Variable> entityToSql(BlogsCompanion d) {
    final map = <String, Variable>{};
    if (d.id.present) {
      map['id'] = Variable<int, IntType>(d.id.value);
    }
    if (d.title.present) {
      map['title'] = Variable<String, StringType>(d.title.value);
    }
    if (d.description.present) {
      map['description'] = Variable<String, StringType>(d.description.value);
    }
    if (d.image.present) {
      map['image'] = Variable<String, StringType>(d.image.value);
    }
    if (d.isFromFirebase.present) {
      map['is_from_firebase'] = Variable<int, IntType>(d.isFromFirebase.value);
    }
    if (d.url.present) {
      map['url'] = Variable<String, StringType>(d.url.value);
    }
    if (d.createTime.present) {
      map['create_time'] = Variable<DateTime, DateTimeType>(d.createTime.value);
    }
    return map;
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
  factory Project.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
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
  Map<String, dynamic> toJson(
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return {
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String>(description),
      'image': serializer.toJson<String>(image),
      'isFromFirebase': serializer.toJson<int>(isFromFirebase),
      'url': serializer.toJson<String>(url),
      'createTime': serializer.toJson<DateTime>(createTime),
    };
  }

  @override
  ProjectsCompanion createCompanion(bool nullToAbsent) {
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
  bool operator ==(other) =>
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
    @required int isFromFirebase,
    @required String url,
    this.createTime = const Value.absent(),
  })  : name = Value(name),
        description = Value(description),
        image = Value(image),
        isFromFirebase = Value(isFromFirebase),
        url = Value(url);
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
}

class $ProjectsTable extends Projects with TableInfo<$ProjectsTable, Project> {
  final GeneratedDatabase _db;
  final String _alias;
  $ProjectsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
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
    );
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
  VerificationContext validateIntegrity(ProjectsCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.id.present) {
      context.handle(_idMeta, id.isAcceptableValue(d.id.value, _idMeta));
    } else if (id.isRequired && isInserting) {
      context.missing(_idMeta);
    }
    if (d.name.present) {
      context.handle(
          _nameMeta, name.isAcceptableValue(d.name.value, _nameMeta));
    } else if (name.isRequired && isInserting) {
      context.missing(_nameMeta);
    }
    if (d.description.present) {
      context.handle(_descriptionMeta,
          description.isAcceptableValue(d.description.value, _descriptionMeta));
    } else if (description.isRequired && isInserting) {
      context.missing(_descriptionMeta);
    }
    if (d.image.present) {
      context.handle(
          _imageMeta, image.isAcceptableValue(d.image.value, _imageMeta));
    } else if (image.isRequired && isInserting) {
      context.missing(_imageMeta);
    }
    if (d.isFromFirebase.present) {
      context.handle(
          _isFromFirebaseMeta,
          isFromFirebase.isAcceptableValue(
              d.isFromFirebase.value, _isFromFirebaseMeta));
    } else if (isFromFirebase.isRequired && isInserting) {
      context.missing(_isFromFirebaseMeta);
    }
    if (d.url.present) {
      context.handle(_urlMeta, url.isAcceptableValue(d.url.value, _urlMeta));
    } else if (url.isRequired && isInserting) {
      context.missing(_urlMeta);
    }
    if (d.createTime.present) {
      context.handle(_createTimeMeta,
          createTime.isAcceptableValue(d.createTime.value, _createTimeMeta));
    } else if (createTime.isRequired && isInserting) {
      context.missing(_createTimeMeta);
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
  Map<String, Variable> entityToSql(ProjectsCompanion d) {
    final map = <String, Variable>{};
    if (d.id.present) {
      map['id'] = Variable<int, IntType>(d.id.value);
    }
    if (d.name.present) {
      map['name'] = Variable<String, StringType>(d.name.value);
    }
    if (d.description.present) {
      map['description'] = Variable<String, StringType>(d.description.value);
    }
    if (d.image.present) {
      map['image'] = Variable<String, StringType>(d.image.value);
    }
    if (d.isFromFirebase.present) {
      map['is_from_firebase'] = Variable<int, IntType>(d.isFromFirebase.value);
    }
    if (d.url.present) {
      map['url'] = Variable<String, StringType>(d.url.value);
    }
    if (d.createTime.present) {
      map['create_time'] = Variable<DateTime, DateTimeType>(d.createTime.value);
    }
    return map;
  }

  @override
  $ProjectsTable createAlias(String alias) {
    return $ProjectsTable(_db, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $BlogsTable _blogs;
  $BlogsTable get blogs => _blogs ??= $BlogsTable(this);
  $ProjectsTable _projects;
  $ProjectsTable get projects => _projects ??= $ProjectsTable(this);
  BlogDao _blogDao;
  BlogDao get blogDao => _blogDao ??= BlogDao(this as AppDatabase);
  ProjectDao _projectDao;
  ProjectDao get projectDao => _projectDao ??= ProjectDao(this as AppDatabase);
  @override
  List<TableInfo> get allTables => [blogs, projects];
}
