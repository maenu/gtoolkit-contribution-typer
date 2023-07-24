Extension { #name : #Number }

{ #category : #'*Typer-Shadow-Pharo' }
Number >> typShaMethodBinary233: aLookup [
	<typShaMethod: '-'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: {aLookup root receiver.
				aLookup arguments at: 1} typAsType
		arguments: {Number typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
Number >> typShaMethodBinary235: aLookup [
	<typShaMethod: '+'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: {aLookup root receiver.
				aLookup arguments at: 1} typAsType
		arguments: {Number typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
Number >> typShaMethodBinary: aLookup [
	<typShaMethod: '@'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Point typAsType
		arguments: {Number typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
Number >> typShaMethodTimesCollect: aLookup [
	<typShaMethod: 'timesCollect:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (OrderedCollection typAsType
				withParameters: {(aLookup arguments
							collect: [ :e | e isFunction ifTrue: [ e result ] ifFalse: [ e ] ])
							typAsType})
		arguments: {BlockClosure
					typAsFunctionTypeWithResult: TypUnknownType instance
					arguments: {Integer typAsType}
					argumentsOptional: true
					signalsAlways: false}
]

{ #category : #'*Typer-Shadow-Pharo' }
Number >> typShaMethodTo: aLookup [
	<typShaMethod: 'to:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (Interval typAsType
				withParameters: {{aLookup root receiver.
							aLookup arguments at: 1} typAsType})
		arguments: {Number typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
Number >> typShaMethodToDo: aLookup [
	<typShaMethod: 'to:do:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup root receiver
		arguments: {Number typAsType.
				BlockClosure
					typAsFunctionTypeWithResult: TypUnknownType instance
					arguments: {{aLookup root receiver.
								aLookup arguments at: 1} typAsType}}
]
