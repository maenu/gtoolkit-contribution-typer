Extension { #name : 'RPackageTag' }

{ #category : '*Typer-GToolkit' }
RPackageTag >> typGtCoverageFor: aView context: aDictionary [
	<gtPackageTagView>
	^ aView explicit
		title: 'Coverage';
		priority: 50;
		stencil: [ BlElement new
				layout: BlLinearLayout vertical;
				constraintsDo: [ :c | 
					c horizontal fitContent.
					c vertical fitContent ];
				addChildren:
					{(BrLabel new
						aptitude: BrGlamorousLabelLook;
						text: 'methods';
						yourself).
					self typGtMethodCoverage typGtAsCoverageElement.
					(BrLabel new
						look: BrGlamorousLabelLook;
						text: 'nodes';
						yourself).
					self typGtNodeCoverage typGtAsCoverageElement};
				yourself ];
		yourself
]

{ #category : '*Typer-GToolkit' }
RPackageTag >> typGtMethodCoverage [
	| result |
	result := Dictionary new
		at: true put: IdentitySet new;
		at: false put: IdentitySet new;
		at: nil put: IdentitySet new;
		yourself.
	self classes
		do: [ :c | 
			c typGtMethodCoverage
				keysAndValuesDo: [ :k :v | (result at: k) addAll: v ] ].
	^ result
]

{ #category : '*Typer-GToolkit' }
RPackageTag >> typGtNodeCoverage [
	| result |
	result := Dictionary new
		at: true put: IdentitySet new;
		at: false put: IdentitySet new;
		at: nil put: IdentitySet new;
		yourself.
	self classes
		do: [ :c | 
			c typGtNodeCoverage
				keysAndValuesDo: [ :k :v | (result at: k) addAll: v ] ].
	^ result
]
