Class {
	#name : #TypPraVariableResolver,
	#superclass : #TypResolver,
	#category : #'Typer-Pragma-Core'
}

{ #category : #'as yet unclassified' }
TypPraVariableResolver >> resolverFor: aLookup [
	| clazz pragma |
	self assert: [ self resolves: aLookup ].
	clazz := aLookup receiverType asClass.
	aLookup selector first isUppercase
		ifTrue: [ clazz := clazz classSide ].
	pragma := (clazz methods detect: [ :e | e selector = #initialize ]) pragmas detect: [ :e | e selector = #typTypeVariable:as: and: [ e arguments first = aLookup selector ] ].
	^ TypVariableResolver new
		receiverType: clazz typAsType;
		selector: aLookup selector;
		type: [ (pragma arguments at: 2) typAsType ];
		yourself
]

{ #category : #'as yet unclassified' }
TypPraVariableResolver >> resolves: aLookup [
	| clazz |
	aLookup receiverType hasClass
		ifFalse: [ ^ false ].
	clazz := aLookup receiverType asClass.
	aLookup selector first isUppercase
		ifTrue: [ clazz := clazz classSide ].
	^ clazz methods
		anySatisfy:
			[ :e | e selector = #initialize and: [ e pragmas anySatisfy: [ :f | f selector = #typTypeVariable:as: and: [ f arguments first = aLookup selector ] ] ] ]
]
