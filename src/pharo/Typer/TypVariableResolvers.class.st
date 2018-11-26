Class {
	#name : #TypVariableResolvers,
	#superclass : #TypResolvers,
	#category : #'Typer-Core'
}

{ #category : #'as yet unclassified' }
TypVariableResolvers >> typTypeForVariableNamed: aString ofClass: aClass [
	^ self typTypeForVariableNamed: aString ofClass: aClass withDiscovered: Set new
]

{ #category : #'as yet unclassified' }
TypVariableResolvers >> typTypeForVariableNamed: aString ofClass: aClass withDiscovered: aSet [
	((resolvers select: [ :e | e resolves: aClass -> aString ]) collect: [ :e | e resolverFor: aClass -> aString ])
		do: [ :e | 
			| type |
			type := e typTypeWithDiscovered: aSet.
			type isUnknown
				ifFalse: [ ^ type ] ].
	^ TypUnknownType instance
]
