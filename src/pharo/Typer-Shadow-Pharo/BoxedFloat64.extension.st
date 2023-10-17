Extension { #name : #BoxedFloat64 }

{ #category : #'*Typer-Shadow-Pharo' }
BoxedFloat64 >> typShaMethodBinaryGreater: aLookup [
	<typShaMethod: '>'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Float typAsType
		arguments: {Boolean typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
BoxedFloat64 >> typShaMethodBinaryGreaterOrEqual: aLookup [
	<typShaMethod: '>='>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Boolean typAsType
		arguments: {Number typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
BoxedFloat64 >> typShaMethodBinaryLess: aLookup [
	<typShaMethod: '<'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Float typAsType
		arguments: {Boolean typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
BoxedFloat64 >> typShaMethodBinaryLessOrEqual: aLookup [
	<typShaMethod: '<='>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Boolean typAsType
		arguments: {Number typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
BoxedFloat64 >> typShaMethodUnaryTruncated: aLookup [
	<typShaMethod: 'truncated'>
	^ CompiledMethod typAsFunctionTypeWithResult: SmallInteger typAsType
]
