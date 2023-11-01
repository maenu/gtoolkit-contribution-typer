Extension { #name : #Number }

{ #category : #'*Typer-Shadow-Pharo' }
Number >> typShaMethodBinaryAt: aLookup root: anotherLookup [
	<typShaMethod: '@'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Point typAsType
		arguments: {Number typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
Number >> typShaMethodBinaryDivide: aLookup root: anotherLookup [
	<typShaMethod: '/'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Number typAsType
		arguments: {Number typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
Number >> typShaMethodBinaryIntegerDivide: aLookup root: anotherLookup [
	<typShaMethod: '//'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Integer typAsType
		arguments: {Number typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
Number >> typShaMethodBinaryMinus: aLookup root: anotherLookup [
	<typShaMethod: '-'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Number typAsType
		arguments: {Number typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
Number >> typShaMethodBinaryModulo: aLookup root: anotherLookup [
	<typShaMethod: '\\'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Number typAsType
		arguments: {Number typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
Number >> typShaMethodBinaryMultiply: aLookup root: anotherLookup [
	<typShaMethod: '*'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Number typAsType
		arguments: {Number typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
Number >> typShaMethodBinaryPlus: aLookup root: anotherLookup [
	<typShaMethod: '+'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Number typAsType
		arguments: {Number typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
Number >> typShaMethodKeywordQuo: aLookup root: anotherLookup [
	<typShaMethod: 'quo:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Integer typAsType
		arguments: {Number typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
Number >> typShaMethodKeywordRem: aLookup root: anotherLookup [
	<typShaMethod: 'rem:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Number typAsType
		arguments: {Number typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
Number >> typShaMethodKeywordTimesCollect: aLookup root: anotherLookup [
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
Number >> typShaMethodKeywordTo: aLookup root: anotherLookup [
	<typShaMethod: 'to:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (Interval typAsType
				withParameters: {{aLookup self.
							aLookup arguments at: 1} typAsType})
		arguments: {Number typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
Number >> typShaMethodUnaryAbs: aLookup root: anotherLookup [
	<typShaMethod: 'abs'>
	^ CompiledMethod typAsFunctionTypeWithResult: Number typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
Number >> typShaMethodUnaryNegated: aLookup root: anotherLookup [
	<typShaMethod: 'negated'>
	^ CompiledMethod typAsFunctionTypeWithResult: anotherLookup self
]

{ #category : #'*Typer-Shadow-Pharo' }
Number >> typShaMethodUnaryReciprocal: aLookup root: anotherLookup [
	<typShaMethod: 'reciprocal'>
	^ CompiledMethod typAsFunctionTypeWithResult: Number typAsType
]
