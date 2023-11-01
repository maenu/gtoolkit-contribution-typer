Extension { #name : #SmallFloat64 }

{ #category : #'*Typer-Shadow-Pharo' }
SmallFloat64 >> typShaMethodBinaryGreater: aLookup root: anotherLookup [
	<typShaMethod: '>'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Boolean typAsType
		arguments: {Float typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
SmallFloat64 >> typShaMethodBinaryGreaterOrEqual: aLookup root: anotherLookup [
	<typShaMethod: '>='>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Boolean typAsType
		arguments: {Number typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
SmallFloat64 >> typShaMethodBinaryLess: aLookup root: anotherLookup [
	<typShaMethod: '<'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Boolean typAsType
		arguments: {Float typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
SmallFloat64 >> typShaMethodBinaryLessOrEqual: aLookup root: anotherLookup [
	<typShaMethod: '<='>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Boolean typAsType
		arguments: {Number typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
SmallFloat64 >> typShaMethodUnaryTruncated: aLookup root: anotherLookup [
	<typShaMethod: 'truncated'>
	^ CompiledMethod typAsFunctionTypeWithResult: SmallInteger typAsType
]
