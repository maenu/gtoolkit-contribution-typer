Class {
	#name : #TypStaVariableResolver,
	#superclass : #TypResolver,
	#category : #'Typer-Static-Core'
}

{ #category : #'as yet unclassified' }
TypStaVariableResolver >> resolverFor: anAssociation [
	| type name |
	self assert: [ self resolves: anAssociation ].
	type := anAssociation key.
	name := anAssociation value.
	type hasClass
		ifFalse: [ ^ false ].
	^ type asClass isMeta
		ifTrue: [ type asClass instanceSide typStaClassVariableResolver ]
		ifFalse: [ type asClass typStaVariableResolver ]
]

{ #category : #'as yet unclassified' }
TypStaVariableResolver >> resolverFor_: anAssociation [
	| type name |
	self assert: [ self resolves: anAssociation ].
	type := anAssociation key.
	name := anAssociation value.
	[ type hasClass
		ifFalse: [ ^ false ].
	type asClass isMeta
		ifTrue: [ (type asClass instanceSide typStaResolvesClassInstanceVariable: name) or: [ type asClass instanceSide typStaResolvesClassVariable: name ] ]
		ifFalse: [ (type asClass typStaResolvesInstanceVariable: name) or: [ type asClass typStaResolvesClassVariable: name ] ] ] whileFalse: [ type := type superType ].
	^ type asClass isMeta
		ifTrue: [ type asClass instanceSide typStaVariableResolver ]
		ifFalse: [ type asClass typStaVariableResolver ]
]

{ #category : #'as yet unclassified' }
TypStaVariableResolver >> resolves: anAssociation [
	| type name |
	type := anAssociation key.
	name := anAssociation value.
	[ type hasClass
		ifFalse: [ ^ false ].
	type asClass isMeta
		ifTrue: [ (type asClass instanceSide typStaResolvesClassInstanceVariable: name) or: [ type asClass instanceSide typStaResolvesClassVariable: name ] ]
		ifFalse: [ (type asClass typStaResolvesInstanceVariable: name) or: [ type asClass typStaResolvesClassVariable: name ] ] ] whileFalse: [ type := type superType ].
	^ true
]

{ #category : #'as yet unclassified' }
TypStaVariableResolver >> resolves_: anAssociation [
	| type name |
	type := anAssociation key.
	name := anAssociation value.
	[ type hasClass
		ifFalse: [ ^ false ].
	type asClass isMeta
		ifTrue: [ (type asClass instanceSide typStaResolvesClassInstanceVariable: name) or: [ type asClass instanceSide typStaResolvesClassVariable: name ] ]
		ifFalse: [ (type asClass typStaResolvesInstanceVariable: name) or: [ type asClass typStaResolvesClassVariable: name ] ] ] whileFalse: [ type := type superType ].
	^ true
]
