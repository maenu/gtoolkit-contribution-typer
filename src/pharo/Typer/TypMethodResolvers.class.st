Class {
	#name : #TypMethodResolvers,
	#superclass : #TypResolvers,
	#category : #'Typer-Core'
}

{ #category : #accessing }
TypMethodResolvers >> typeForArgumentAt: anInteger ofMethod: anAssociation [
	^ self typeFor: anAssociation using: [ :r :a | r argumentTypeAt: anInteger for: anAssociation resolvedBy: a ]
]

{ #category : #'as yet unclassified' }
TypMethodResolvers >> typeForResultOfMethod: anAssociation [
	| type |
	type := self typeFor: anAssociation using: [ :r :a | r resultTypeFor: anAssociation resolvedBy: a ].
	(type isUnknown and: [ anAssociation key hasClass ])
		ifTrue: [ "assume self return if no explicit return"
			| method |
			method := anAssociation key asClass lookupSelector: anAssociation value key.
			(method isNotNil and: [ method isAbstract not and: [ (method ast allChildren select: #isReturn) isEmpty ] ])
				ifTrue: [ ^ anAssociation key ] ].
	^ type
]
