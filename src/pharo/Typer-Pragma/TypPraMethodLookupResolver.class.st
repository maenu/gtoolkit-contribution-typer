Class {
	#name : #TypPraMethodLookupResolver,
	#superclass : #TypLookupResolver,
	#category : #'Typer-Pragma'
}

{ #category : #accessing }
TypPraMethodLookupResolver >> resolve: aLookup [
	<typTypeArgument: 1 as: 'TypMethodLookup'>
	<typTypeResultAs: 'SequenceableCollection<TypFunctionType>'>
	| classDescription method pragmas argumentPragmas resultPragma signalsAlwaysPragma arguments result signalsAlways |
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
	arguments := method numArgs
		timesCollect: [ :i | 
			argumentPragmas
				at: i
				ifPresent: [ :e | e arguments second typAsType ]
				ifAbsent: [ TypUnknownType new ] ].
	result := resultPragma
		ifNil: [ TypUnknownType new ]
		ifNotNil: [ resultPragma arguments first typAsType ].
	signalsAlways := signalsAlwaysPragma
		ifNil: [ nil ]
		ifNotNil: [ signalsAlwaysPragma arguments first ifNotNil: #asBoolean ].
	^ {(TypFunctionType
		classDescription: classDescription
		result: result
		arguments: arguments
		argumentsOptional: false
		signalsAlways: signalsAlways)}
]
