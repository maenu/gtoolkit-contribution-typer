Extension { #name : #BoxedFloat64 }

{ #category : #'*Typer-Shadow-Pharo' }
BoxedFloat64 >> typShaMethodBinaryDivide: aLookup [
	<typShaMethod: '/'>
	^ super typShaMethodBinaryDivide: aLookup
]

{ #category : #'*Typer-Shadow-Pharo' }
BoxedFloat64 >> typShaMethodBinaryEqual: aLookup [
	<typShaMethod: '='>
	^ super typShaMethodBinaryEqual: aLookup
]

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
BoxedFloat64 >> typShaMethodBinaryMinus: aLookup [
	<typShaMethod: '-'>
	^ super typShaMethodBinaryMinus: aLookup
]

{ #category : #'*Typer-Shadow-Pharo' }
BoxedFloat64 >> typShaMethodBinaryMultiply: aLookup [
	<typShaMethod: '*'>
	^ super typShaMethodBinaryMultiply: aLookup
]

{ #category : #'*Typer-Shadow-Pharo' }
BoxedFloat64 >> typShaMethodBinaryPlus: aLookup [
	<typShaMethod: '+'>
	^ super typShaMethodBinaryPlus: aLookup
]

{ #category : #'*Typer-Shadow-Pharo' }
BoxedFloat64 >> typShaMethodUnaryTruncated: aLookup [
	<typShaMethod: 'truncated'>
	^ CompiledMethod typAsFunctionTypeWithResult: SmallInteger typAsType
]
