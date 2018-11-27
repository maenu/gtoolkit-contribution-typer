Class {
	#name : #TypPraMethodResolver,
	#superclass : #TypResolver,
	#category : #'Typer-Pragma-Core'
}

{ #category : #'as yet unclassified' }
TypPraMethodResolver >> resolverFor: anAssociation [
	| clazz method argumentPragmas resultPragma argumentTypes resultType |
	self assert: [ self resolves: anAssociation ].
	clazz := anAssociation key asClass.
	method := clazz methods detect: [ :e | e selector = anAssociation value key ].
	argumentPragmas := method pragmas select: [ :e | e selector = #typTypeArgument:as: ].
	resultPragma := method pragmas detect: [ :e | e selector = #typTypeResultAs: ] ifNone: [ nil ].
	argumentTypes := method numArgs
		timesCollect: [ :i | 
			argumentPragmas
				detect: [ :e | (e arguments at: 1) = i ]
				ifFound: [ :e | (e arguments at: 2) typAsType ]
				ifNone: [ TypUnknownType instance ] ].
	resultType := resultPragma
		ifNil: [ TypUnknownType instance ]
		ifNotNil: [ resultPragma arguments first typAsType ].
	^ TypMethodResolver new
		receiverType: clazz typAsType;
		selector: method selector;
		argumentTypes: [ :r :i | argumentTypes at: i ];
		resultType: [ resultType ];
		yourself
]

{ #category : #'as yet unclassified' }
TypPraMethodResolver >> resolves: anAssociation [
	| clazz |
	anAssociation key hasClass
		ifFalse: [ ^ false ].
	clazz := anAssociation key asClass.
	^ clazz methods
		anySatisfy: [ :e | 
			e selector = anAssociation value key
				and: [ e pragmas anySatisfy: [ :f | f selector = #typTypeArgument:as: or: [ f selector = #typTypeResultAs: ] ] ] ]
]
