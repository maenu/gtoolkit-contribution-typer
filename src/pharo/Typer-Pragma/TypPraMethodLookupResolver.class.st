Class {
	#name : #TypPraMethodLookupResolver,
	#superclass : #TypLookupResolver,
	#category : #'Typer-Pragma'
}

{ #category : #accessing }
TypPraMethodLookupResolver >> resolve: aLookup [
	<typTypeArgument: 1 as: 'TypMethodLookup'>
	<typTypeResultAs: 'SequenceableCollection<TypFunctionType>'>
	| classDescription method pragmas argumentPragmas resultPragma signalsAlwaysPragma argumentTypes resultType signalsAlways |
	aLookup push: self.
	aLookup receiverType isNamed
		ifFalse: [ TypNoTypeError signal ].
	aLookup receiverType hasClassDescription
		ifFalse: [ TypNoTypeError signal ].
	classDescription := aLookup receiverType classDescription.
	method := (classDescription lookupSelector: aLookup selector)
		ifNil: [ TypNoTypeError signal ].
	pragmas := method typPraAllPragmas.
	argumentPragmas := ((pragmas
		select: [ :e | e selector = #typTypeArgument:as: ])
		groupedBy: [ :e | e arguments first ]) collect: #first.
	resultPragma := pragmas
		detect: [ :e | e selector = #typTypeResultAs: ]
		ifNone: [ nil ].
	signalsAlwaysPragma := pragmas
		detect: [ :e | e selector = #typSignalsAlways: ]
		ifNone: [ nil ].
	(argumentPragmas isEmpty
		and: [ resultPragma isNil and: [ signalsAlwaysPragma isNil ] ])
		ifTrue: [ ^ nil ].
	argumentTypes := method numArgs
		timesCollect: [ :i | 
			argumentPragmas
				at: i
				ifPresent: [ :e | e arguments second typAsType ]
				ifAbsent: [ TypUnknownType new ] ].
	resultType := resultPragma
		ifNil: [ TypUnknownType new ]
		ifNotNil: [ resultPragma arguments first typAsType ].
	signalsAlways := signalsAlwaysPragma
		ifNil: [ nil ]
		ifNotNil: [ signalsAlwaysPragma arguments first ].
	self
		flag: 'TODO use signals and rework once function type refactored'.
	^ {(TypFunctionType
		classDescription: classDescription
		argumentsSize: argumentTypes size
		argumentsOptional: false
		parameters:
			({('@0' -> resultType)}
				, (argumentTypes withIndexCollect: [ :e :i | ('@' , i asString) -> e ]))
				asOrderedDictionary)}
]
