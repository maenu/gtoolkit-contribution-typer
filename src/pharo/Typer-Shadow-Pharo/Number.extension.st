Extension { #name : #Number }

{ #category : #'*Typer-Shadow-Pharo' }
Number >> typShaMethodBinaryAt: aLookup [
	<typShaMethod: '@'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Point typAsType
		arguments: {Number typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
Number >> typShaMethodBinaryDivide: aLookup [
	<typShaMethod: '/'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Number typAsType
		arguments: {Number typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
Number >> typShaMethodBinaryIntegerDivide: aLookup [
	<typShaMethod: '//'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Integer typAsType
		arguments: {Number typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
Number >> typShaMethodBinaryMinus: aLookup [
	<typShaMethod: '-'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Number typAsType
		arguments: {Number typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
Number >> typShaMethodBinaryModulo: aLookup [
	<typShaMethod: '\\'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Number typAsType
		arguments: {Number typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
Number >> typShaMethodBinaryMultiply: aLookup [
	<typShaMethod: '*'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Number typAsType
		arguments: {Number typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
Number >> typShaMethodBinaryPlus: aLookup [
	<typShaMethod: '+'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Number typAsType
		arguments: {Number typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
Number >> typShaMethodKeywordQuo: aLookup [
	<typShaMethod: 'quo:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Integer typAsType
		arguments: {Number typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
Number >> typShaMethodKeywordRem: aLookup [
	<typShaMethod: 'rem:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Number typAsType
		arguments: {Number typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
Number >> typShaMethodKeywordTimesCollect: aLookup [
	<typShaMethod: 'timesCollect:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (OrderedCollection typAsType
				withParameters: {(aLookup arguments
							collect: [ :e | e isFunction ifTrue: [ e result ] ifFalse: [ e ] ])
							typAsType})
		arguments: {BlockClosure
					typAsFunctionTypeWithResult: TypUnknownType instance
					arguments: {Integer typAsType}
					argumentsOptional: true}
]

{ #category : #'*Typer-Shadow-Pharo' }
Number >> typShaMethodKeywordTo: aLookup [
	<typShaMethod: 'to:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (Interval typAsType
				withParameters: {{aLookup self.
							aLookup arguments at: 1} typAsType})
		arguments: {Number typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
Number >> typShaMethodUnaryAbs: aLookup [
	<typShaMethod: 'abs'>
	^ CompiledMethod typAsFunctionTypeWithResult: Number typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
Number >> typShaMethodUnaryNegated: aLookup [
	<typShaMethod: 'negated'>
	^ CompiledMethod typAsFunctionTypeWithResult: aLookup root self
]

{ #category : #'*Typer-Shadow-Pharo' }
Number >> typShaMethodUnaryReciprocal: aLookup [
	<typShaMethod: 'reciprocal'>
	^ CompiledMethod typAsFunctionTypeWithResult: Number typAsType
]
