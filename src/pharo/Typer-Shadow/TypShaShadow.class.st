Class {
	#name : #TypShaShadow,
	#superclass : #TypResolver,
	#category : #'Typer-Shadow-Core'
}

{ #category : #converting }
TypShaShadow class >> asMethodResolvers [
	^ {(TypShaMethodResolver new
		shadow: self;
		yourself).
	(TypShaMethodResolver new
		shadow: self new;
		yourself)}
]

{ #category : #accessing }
TypShaShadow class >> asType: aClass [
	^ aClass typAsNamedType
]

{ #category : #converting }
TypShaShadow class >> asTypeResolvers [
	^ {(TypShaTypeResolver new
		shadow: self;
		yourself).
	(TypShaTypeResolver new
		shadow: self new;
		yourself)}
]

{ #category : #converting }
TypShaShadow class >> asVariableResolvers [
	^ {(TypShaVariableResolver new
		shadow: self;
		yourself).
	(TypShaVariableResolver new
		shadow: self new;
		yourself)}
]

{ #category : #accessing }
TypShaShadow class >> shadowClassesFor: aClass [
	<typTypeArgument: 1 as: 'ClassDescription'>
	<typTypeResultAs: 'SequenceableCollection<ClassDescription>'>
	^ self allSubclasses
		select: [ :e | e shadowedClass == aClass classSide ]
]

{ #category : #'as yet unclassified' }
TypShaShadow class >> shadowedClass [
	<typTypeResultAs: 'ClassDescription'>
	self subclassResponsibility
]

{ #category : #accessing }
TypShaShadow class >> typeResolver [
	^ TypTypeResolver new
		type: [ :a | self asType: a clazz ];
		yourself
]

{ #category : #converting }
TypShaShadow >> asType: aClass [
	<typTypeArgument: 1 as: 'ClassDescription'>
	<typTypeResultAs: 'TypType'>
	^ aClass typAsNamedType
]

{ #category : #accessing }
TypShaShadow >> shadowedClass [
	<typTypeResultAs: 'ClassDescription'>
	^ self class shadowedClass instanceSide
]

{ #category : #accessing }
TypShaShadow >> typeResolver [
	<typTypeResultAs: 'TypTypeResolver<TypTypeLookup>'>
	^ TypTypeResolver new
		type: [ :a | self asType: a clazz ];
		yourself
]
