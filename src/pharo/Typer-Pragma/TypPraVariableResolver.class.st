Class {
	#name : #TypPraVariableResolver,
	#superclass : #TypResolver,
	#category : #'Typer-Pragma-Core'
}

{ #category : #'as yet unclassified' }
TypPraVariableResolver >> resolverFor: anAssociation [
	| clazz pragma |
	self assert: [ self resolves: anAssociation ].
	clazz := anAssociation key asClass.
	anAssociation value first isUppercase
		ifTrue: [ clazz := clazz classSide ].
	pragma := (clazz methods detect: [ :e | e selector = #initialize ]) pragmas
		detect: [ :e | e selector = #typTypeVariable:as: and: [ e arguments first = anAssociation value ] ].
	anAssociation value first isUppercase
		ifTrue: [ clazz := clazz instanceSide ].
	^ TypVariableResolver new
		receiverType: clazz typAsType;
		selector: anAssociation value;
		type: [ (pragma arguments at: 2) typAsType ];
		yourself
]

{ #category : #'as yet unclassified' }
TypPraVariableResolver >> resolves: anAssociation [
	| clazz |
	anAssociation key hasClass
		ifFalse: [ ^ false ].
	clazz := anAssociation key asClass.
	anAssociation value first isUppercase
		ifTrue: [ clazz := clazz classSide ].
	^ clazz methods
		anySatisfy: [ :e | 
			e selector = #initialize
				and: [ e pragmas
						anySatisfy: [ :f | f selector = #typTypeVariable:as: and: [ f arguments first = anAssociation value ] ] ] ]
]
