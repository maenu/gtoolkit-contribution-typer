Extension { #name : #Number }

{ #category : #'*Typer-Shadow-Pharo' }
Number >> typShaMethodAbs: aLookup [
	<typShaMethod: 'abs'>
	^ CompiledMethod typAsFunctionTypeWithResult: Number typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
Number >> typShaMethodBinary1: aLookup [
	<typShaMethod: '*'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Number typAsType
		arguments: {Number typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
Number >> typShaMethodBinary2: aLookup [
	<typShaMethod: '+'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Number typAsType
		arguments: {Number typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
Number >> typShaMethodBinary3: aLookup [
	<typShaMethod: '-'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Number typAsType
		arguments: {Number typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
Number >> typShaMethodBinary4: aLookup [
	<typShaMethod: '/'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Number typAsType
		arguments: {Number typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
Number >> typShaMethodBinary5: aLookup [
	<typShaMethod: '//'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Number typAsType
		arguments: {Number typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
Number >> typShaMethodBinary6: aLookup [
	<typShaMethod: '\\'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Number typAsType
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
Number >> typShaMethodNegated: aLookup [
	<typShaMethod: 'negated'>
	^ CompiledMethod typAsFunctionTypeWithResult: Number typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
Number >> typShaMethodQuo: aLookup [
	<typShaMethod: 'quo:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Integer typAsType
		arguments: {Number typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
Number >> typShaMethodReciprocal: aLookup [
	<typShaMethod: 'reciprocal'>
	^ CompiledMethod typAsFunctionTypeWithResult: Number typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
Number >> typShaMethodRem: aLookup [
	<typShaMethod: 'rem:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Number typAsType
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
					argumentsOptional: true}
]

{ #category : #'*Typer-Shadow-Pharo' }
Number >> typShaMethodTo: aLookup [
	<typShaMethod: 'to:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (Interval typAsType
				withParameters: {{aLookup self.
							aLookup arguments at: 1} typAsType})
		arguments: {Number typAsType}
]
