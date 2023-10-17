Extension { #name : #SmallFloat64 }

{ #category : #'*Typer-Shadow-Pharo' }
SmallFloat64 >> typShaMethodBinaryGreater: aLookup [
	<typShaMethod: '>'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Boolean typAsType
		arguments: {Float typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
SmallFloat64 >> typShaMethodBinaryGreaterOrEqual: aLookup [
	<typShaMethod: '>='>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Boolean typAsType
		arguments: {Number typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
SmallFloat64 >> typShaMethodBinaryLess: aLookup [
	<typShaMethod: '<'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Boolean typAsType
		arguments: {Float typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
SmallFloat64 >> typShaMethodBinaryLessOrEqual: aLookup [
	<typShaMethod: '<='>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Boolean typAsType
		arguments: {Number typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
SmallFloat64 >> typShaMethodUnaryTruncated: aLookup [
	<typShaMethod: 'truncated'>
	^ CompiledMethod typAsFunctionTypeWithResult: SmallInteger typAsType
]
