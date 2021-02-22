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
	
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | 
			i = 1
				ifTrue: [ GtPharoMethodNode typAsType ]
				ifFalse: [ Integer typAsType ] ];
		resultType: [ :a :s :r | 
			SequenceableCollection typAsType
				copyWithParameters: {GtCompletionAction typAsType} ];
		yourself
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
	
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | 
			i = 1
				ifTrue: [ Integer typAsType ]
				ifFalse: [ GtPharoMethodNode typAsType ] ];
		resultType: [ :a :s :r | GtPharoProgramNode typAsType asNullable ];
		yourself
]

{ #category : #shadow }
TypShaGtGtPharoCompletionStrategy >> mSelectorsForReceiverMatching: aLookup [ 
	<typShaMethod: 'selectorsForReceiver:matching:'>
	
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | 
			i = 1
				ifTrue: [ Behavior typAsType ]
				ifFalse: [ String typAsType ] ];
		resultType: [ :a :s :r | 
			SequenceableCollection typAsType
				copyWithParameters: {String typAsType} ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaGtGtPharoCompletionStrategy >> vMaxItems: aLookup [
	<typShaForVariable: #maxItems>
	^ Integer typAsType
]
