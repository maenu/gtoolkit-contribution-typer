Class {
	#name : #TypShaShadow,
	#superclass : #TypResolver,
	#classInstVars : [
		'instance'
	],
	#category : #'Typer-Shadow'
}

{ #category : #converting }
TypShaShadow class >> asMethodResolvers [
	^ {(TypShaMethodResolver new
		shadow: self;
		yourself).
	(TypShaMethodResolver new
		shadow: self instance;
		yourself)}
]

{ #category : #converting }
TypShaShadow class >> asTypeResolvers [
	^ {(TypShaTypeResolver new
		shadow: self;
		yourself).
	(TypShaTypeResolver new
		shadow: self instance;
		yourself)}
]

{ #category : #converting }
TypShaShadow class >> asVariableResolvers [
	^ {(TypShaVariableResolver new
		shadow: self;
		yourself).
	(TypShaVariableResolver new
		shadow: self instance;
		yourself)}
]

{ #category : #accessing }
TypShaShadow class >> instance [
	^ instance ifNil: [ instance := self new ]
]

{ #category : #'as yet unclassified' }
TypShaShadow class >> shadowedClass [
	<typTypeResultAs: 'ClassDescription'>
	self subclassResponsibility
]

{ #category : #'as yet unclassified' }
TypShaShadow >> shadowedClass [
	<typTypeResultAs: 'ClassDescription'>
	^ self class shadowedClass instanceSide
]
