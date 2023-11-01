Extension { #name : #BoxedFloat64 }

{ #category : #'*Typer-Shadow-Pharo' }
BoxedFloat64 >> typShaMethodBinaryGreater: aLookup root: anotherLookup [
	<typShaMethod: '>'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Float typAsType
		arguments: {Boolean typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
BoxedFloat64 >> typShaMethodBinaryGreaterOrEqual: aLookup root: anotherLookup [
	<typShaMethod: '>='>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Boolean typAsType
		arguments: {Number typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
BoxedFloat64 >> typShaMethodBinaryLess: aLookup root: anotherLookup [
	<typShaMethod: '<'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Float typAsType
		arguments: {Boolean typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
BoxedFloat64 >> typShaMethodBinaryLessOrEqual: aLookup root: anotherLookup [
	<typShaMethod: '<='>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Boolean typAsType
		arguments: {Number typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
BoxedFloat64 >> typShaMethodUnaryTruncated: aLookup root: anotherLookup [
	<typShaMethod: 'truncated'>
	^ CompiledMethod typAsFunctionTypeWithResult: SmallInteger typAsType
]
