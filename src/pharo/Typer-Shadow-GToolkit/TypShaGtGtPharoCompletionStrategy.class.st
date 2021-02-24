Class {
	#name : #TypShaGtGtPharoCompletionStrategy,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-GToolkit'
}

{ #category : #'as yet unclassified' }
TypShaGtGtPharoCompletionStrategy class >> shadowedClass [
	^ GtPharoCompletionStrategy class
]

{ #category : #shadow }
TypShaGtGtPharoCompletionStrategy >> mActionsForAt: aLookup [
	<typShaMethod: 'actionsFor:at:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult:
			(SequenceableCollection typAsType
				copyWithParameters: {GtCompletionAction typAsType})
		arguments:
			{GtPharoMethodNode typAsType.
			Integer typAsType}
		argumentsOptional: false
		signalsAlways: false
]

{ #category : #shadow }
TypShaGtGtPharoCompletionStrategy >> mClassOrMetaClass: aLookup [
	<typShaMethod: 'classOrMetaClass:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup receiverType
		arguments: {ClassDescription typAsType}
		argumentsOptional: false
		signalsAlways: false
]

{ #category : #shadow }
TypShaGtGtPharoCompletionStrategy >> mIndex: aLookup [
	<typShaMethod: 'index'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Integer typAsType
		arguments: {}
		argumentsOptional: false
		signalsAlways: false
]

{ #category : #shadow }
TypShaGtGtPharoCompletionStrategy >> mNodeForIn: aLookup [
	<typShaMethod: 'nodeFor:in:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: GtPharoProgramNode typAsType asNullable
		arguments:
			{Integer typAsType.
			GtPharoMethodNode typAsType}
		argumentsOptional: false
		signalsAlways: false
]

{ #category : #shadow }
TypShaGtGtPharoCompletionStrategy >> mSelectorsForReceiverMatching: aLookup [
	<typShaMethod: 'selectorsForReceiver:matching:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult:
			(SequenceableCollection typAsType
				copyWithParameters: {String typAsType})
		arguments:
			{Behavior typAsType.
			String typAsType}
		argumentsOptional: false
		signalsAlways: false
]

{ #category : #'as yet unclassified' }
TypShaGtGtPharoCompletionStrategy >> vMaxItems: aLookup [
	<typShaForVariable: #maxItems>
	^ Integer typAsType
]
