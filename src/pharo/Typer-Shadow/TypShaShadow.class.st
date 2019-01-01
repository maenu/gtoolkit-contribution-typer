Class {
	#name : #TypShaShadow,
	#superclass : #TypResolver,
	#category : #'Typer-Shadow-Core'
}

{ #category : #converting }
TypShaShadow class >> asMethodResolvers [
	<typTypeResultAs: 'SequenceableCollection<TypShaMethodResolver<TypMethodLookup>>'>
	^ {(TypShaMethodResolver new
		shadow: self;
		yourself).
	(TypShaMethodResolver new
		shadow: self new;
		yourself)}
]

{ #category : #accessing }
TypShaShadow class >> asType: aClass [
	<typTypeArgument: 1 as: 'ClassDescription'>
	<typTypeResultAs: 'TypNamedType'>
	^ aClass typAsNamedType
]

{ #category : #converting }
TypShaShadow class >> asTypeResolvers [
	<typTypeResultAs: 'SequenceableCollection<TypShaTypeResolver<TypTypeLookup>>'>
	^ {(TypShaTypeResolver new
		shadow: self;
		yourself).
	(TypShaTypeResolver new
		shadow: self new;
		yourself)}
]

{ #category : #converting }
TypShaShadow class >> asVariableResolvers [
	<typTypeResultAs: 'SequenceableCollection<TypShaVariableResolver<TypVariableLookup>>'>
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
	<typTypeResultAs: 'SequenceableCollection<TypShaShadow class>'>
	^ self allSubclasses "typParameters TypShaShadow class"
		select: [ :e | e shadowedClass == aClass classSide ]
]

{ #category : #'as yet unclassified' }
TypShaShadow class >> shadowedClass [
	<typTypeResultAs: 'ClassDescription'>
	self subclassResponsibility
]

{ #category : #accessing }
TypShaShadow class >> typeResolver [
	<typTypeResultAs: 'TypTypeResolver<TypTypeLookup>'>
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
